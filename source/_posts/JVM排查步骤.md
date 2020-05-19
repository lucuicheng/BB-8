---
title: 'JVM排查步骤'
date: 2020-3-23 10:40:33
tags: jvm
---

### 一 、使用jps获取java应用进程号   

(Java Virtual Machine Process Status Tool)      
jps主要用来输出JVM中运行的进程状态信息。语法格式如下：

```shell
jps    [options]      [hostid]

    如果不指定hostid就默认为当前主机或服务器。

    命令行参数选项说明如下：
    
-q # 不输出类名、Jar名和传入main方法的参数

-m # 输出传入main方法的参数

-l # 输出main类或Jar的全限名

-v # 输出传入JVM的参数
```

### 二 、通过进程号，找出该进程内最耗费CPU的线程,


top -Hp pid (常用推荐) 获取线程ID，跟进内存消耗进行选择线程ID号 得到 21742

IME列就是各个Java线程耗费的CPU时间，CPU时间最长的是线程ID为21742的线程


```shell
printf "%x\n" 21742
```

得到21742的十六进制值为54ee，下面会用到。 

使用printf "%x\n" 线程ID 转换为16进制值 或者手工计算线程ID转换为16进制值


也可以使用glances 或者其他内存可视化工具，直接进行分析

<!-- more -->

### 三 、使用jstack查询消耗内存定位值代码层面。
语法格式为：

```shell
jstack 进程号 |grep （转换后的16进制线程ID值) ,可定位至代码层面。
```
例子
```shell
root@ubuntu:/# jstack 21711 | grep 54ee

"PollIntervalRetrySchedulerThread" prio=10 tid=0x00007f950043e000 nid=0x54ee in Object.wait() [0x00007f94c6eda000]

```

可以看到CPU消耗在PollIntervalRetrySchedulerThread这个类的Object.wait()

jstack主要用来查看某个Java进程内的线程堆栈信息。语法格式如下： 

```shell
jstack [option] pid

jstack [option] executable core

jstack [option] [server-id@]remote-hostname-or-ip
```

命令行参数选项说明如下
```shell
-l pid # 来观察锁持有情况
-l long listings # 会打印出额外的锁信息，在发生死锁时可以用
-m mixed mode # 不仅会输出Java堆栈信息，还会输出C/C++堆栈信息（比如Native方法）
```
jstack可以定位到线程堆栈，根据堆栈信息我们可以定位到具体代码，所以它在JVM性能调优中使用得非常多。下面我们来一个实例找出某个Java进程中最耗费CPU的Java线程并定位堆栈信息，用到的命令有ps、top、printf、jstack、grep。


### 四 、jstat（JVM统计监测工具）监控FullGC情况，获取系统FullGC的频率。
语法格式如下：

```shell

jstat [ generalOption | outputOptions vmid [interval[s|ms] [count]] ]
```

例子：vmid是Java虚拟机ID，在Linux/Unix系统上一般就是进程ID。interval是采样时间间隔。count是采样数目。比如下面输出的是GC信息，采样时间间隔为250ms，采样数为4：
```shell
root@ubuntu:/# jstat -gc 21711 250 4

S0C    S1C    S0U    S1U      EC       EU        OC         OU       PC     PU    YGC     YGCT    FGC    FGCT     GCT   

192.0  192.0   64.0   0.0    6144.0   1854.9   32000.0     4111.6   55296.0 25472.7    702    0.431   3      0.218    0.649

192.0  192.0   64.0   0.0    6144.0   1972.2   32000.0     4111.6   55296.0 25472.7    702    0.431   3      0.218    0.649

192.0  192.0   64.0   0.0    6144.0   1972.2   32000.0     4111.6   55296.0 25472.7    702    0.431   3      0.218    0.649

192.0  192.0   64.0   0.0    6144.0   2109.7   32000.0     4111.6   55296.0 25472.7    702    0.431   3      0.218    0.649
```

要明白上面各列的意义，先看JVM堆内存布局：
可以看出：

堆内存 = 年轻代 + 年老代 + 永久代
年轻代 = Eden区 + 两个Survivor区（From和To）

现在来解释各列含义：

S0C、S1C、S0U、S1U：Survivor 0/1区容量（Capacity）和使用量（Used）

EC、EU：Eden区容量和使用量

OC、OU：年老代容量和使用量

PC、PU：永久代容量和使用量

YGC、YGT：年轻代GC次数和GC耗时

FGC、FGCT：Full GC次数和Full GC耗时

GCT：GC总耗时

### 五、 jmap（Memory Map）和jhat（Java Heap Analysis Tool）

jmap用来查看堆内存使用状况，一般结合jhat使用。
jmap语法格式如下：

```shell
jmap [option] pid

jmap [option] executable core

jmap [option] [server-id@]remote-hostname-or-ip

```

如果运行在64位JVM上，可能需要指定-J-d64命令选项参数。

```shell
jmap -permstat pid

```
打印进程的类加载器和类加载器加载的持久代对象信息，输出：类加载器名称、对象是否存活（不可靠）、对象地址、父类加载器、已加载的类大小等信息：

使用jmap -heap pid查看进程堆内存使用情况，包括使用的GC算法、堆配置参数和各代中堆内存使用情况。比例子：
```shell
root@ubuntu:/# jmap -heap 21711

Attaching to process ID 21711, please wait...

Debugger attached successfully.

Server compiler detected.

JVM version is 20.10-b01

using thread-local object allocation.

Parallel GC with 4 thread(s)


Heap Configuration:

MinHeapFreeRatio = 40   

MaxHeapFreeRatio = 70   

MaxHeapSize      = 2067791872 (1972.0MB)

NewSize          = 1310720 (1.25MB)

MaxNewSize       = 17592186044415 MB

OldSize          = 5439488 (5.1875MB)

NewRatio         = 2   

SurvivorRatio    = 8   

PermSize         = 21757952 (20.75MB)

MaxPermSize      = 85983232 (82.0MB)

 

Heap Usage:

PS Young Generation

Eden Space:

   capacity = 6422528 (6.125MB)

   used     = 5445552 (5.1932830810546875MB)

   free     = 976976 (0.9317169189453125MB)

   84.78829520089286% used

From Space:

   capacity = 131072 (0.125MB)

   used     = 98304 (0.09375MB)

   free     = 32768 (0.03125MB)

   75.0% used

To Space:

   capacity = 131072 (0.125MB)

   used     = 0 (0.0MB)

   free     = 131072 (0.125MB)

   0.0% used

PS Old Generation

   capacity = 35258368 (33.625MB)

   used     = 4119544 (3.9287033081054688MB)

   free     = 31138824 (29.69629669189453MB)

   11.683876009235595% used

PS Perm Generation

   capacity = 52428800 (50.0MB)

   used     = 26075168 (24.867218017578125MB)

   free     = 26353632 (25.132781982421875MB)

   49.73443603515625% used

   ....

```

使用jmap -histo[:live] pid查看堆内存中的对象数目、大小统计直方图，如果带上live则只统计活对象，如下：

```shell
root@ubuntu:/# jmap -histo:live 21711 | more

num     #instances         #bytes  class name----------------------------------------------

   1:         38445        5597736  <constMethodKlass>

   2:         38445        5237288  <methodKlass>

   3:          3500        3749504  <constantPoolKlass>

   4:         60858        3242600  <symbolKlass>

   5:          3500        2715264  <instanceKlassKlass>

   6:          2796        2131424  <constantPoolCacheKlass>

   7:          5543        1317400  [I

   8:         13714        1010768  [C

   9:          4752        1003344  [B

  10:          1225         639656  <methodDataKlass>

  11:         14194         454208  java.lang.String

  12:          3809         396136  java.lang.Class

  13:          4979         311952  [S

  14:          5598         287064  [[I

  15:          3028         266464  java.lang.reflect.Method

  16:           280         163520  <objArrayKlassKlass>

  17:          4355         139360  java.util.HashMap$Entry

  18:          1869         138568  [Ljava.util.HashMap$Entry;

  19:          2443          97720  java.util.LinkedHashMap$Entry

  20:          2072          82880  java.lang.ref.SoftReference

  21:          1807          71528  [Ljava.lang.Object;

  22:          2206          70592  java.lang.ref.WeakReference

  23:           934          52304  java.util.LinkedHashMap

  24:           871          48776  java.beans.MethodDescriptor

  25:          1442          46144  java.util.concurrent.ConcurrentHashMap$HashEntry

  26:           804          38592  java.util.HashMap

  27:           948          37920  java.util.concurrent.ConcurrentHashMap$Segment

  28:          1621          35696  [Ljava.lang.Class;

  29:          1313          34880  [Ljava.lang.String;

  30:          1396          33504  java.util.LinkedList$Entry

  31:           462          33264  java.lang.reflect.Field

  32:          1024          32768  java.util.Hashtable$Entry

  33:           948          31440  [Ljava.util.concurrent.ConcurrentHashMap$HashEntry;
```

class name是对象类型，说明如下：

B  byte

C  char

D  double

F  float

I  int

J  long

Z  boolean

[  数组，如[I表示int[]

[L+类名 其他对象


还有一个很常用的情况是：用jmap把进程内存使用情况dump到文件中，再用jhat分析查看。jmap进行dump命令格式如下：

```shell
jmap -dump:format=b,file=dumpFileName pid
```

上面进程ID为21711进行Dump：
```shell
root@ubuntu:/# jmap -dump:format=b,file=/tmp/dump.dat 21711     

Dumping heap to /tmp/dump.dat ...

Heap dump file created
```

dump出来的文件可以用MAT、VisualVM等工具查看，这里用jhat查看：
```shell
root@ubuntu:/# jhat -port 9998 /tmp/dump.dat

Reading from /tmp/dump.dat...

Dump file created Tue Jan 28 17:46:14 CST 2014Snapshot read, resolving...

Resolving 132207 objects...

Chasing references, expect 26 dots..........................

Eliminating duplicate references..........................

Snapshot resolved.

Started HTTP server on port 9998Server is ready.
```
注意如果Dump文件太大，可能需要加上-J-Xmx512m这种参数指定最大堆内存，即jhat -J-Xmx512m -port 9998 /tmp/dump.dat。然后就可以在浏览器中输入主机地址:9998查看了