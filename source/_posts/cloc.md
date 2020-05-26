---
title: 'cloc 统计文件数 排除指定目录'
date: 2020-05-26 13:28:33
tags: 
  - linux
  - cloc
  - 统计
  - 工具
---

```shell
# [统计文件数的路径] 必须包含  [要排除的路径]
cloc --fullpath --not-match-d 要排除的路径  统计文件数的路径
```

