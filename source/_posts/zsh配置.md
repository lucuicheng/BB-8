---
title: 'ss5代理的配置基本安装'
date: 2018-07-23 10:40:33
tags: 
  - mac
  - bash
  - zsh  
---

### zsh 命令配置 

```shell
alias cls='clear'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gci='git commit .'
alias gad='git add .'
alias gpl='git pull'
alias gps='git push' 
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"

#  以下不推荐
alias -s html=mate   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=mate     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
```

