---
title: 'ambx-server 安装配置'
date: 2020-06-29 10:40:33
tags: 
  - linux
  - python
---

# ambx-server

```shell
git clone http://gitlab.retlines.com/actifio/ambx-server.git
```

### install
```shell script
mkvirtualenv -p python3 py3_flask

pip3 install -r requirements.txt
```

### start project
```shell script
python3 run.oy

curl http://127.0.0.1:5000/
```

### api doc

#### generate

```shell script
cd doc
sphinx-quickstart
sphinx-apidoc -o source ../src
make clean
make html
```

#### config
````shell script
# doc/source/conf.py
import os
import sys
sys.path.insert(0, os.path.abspath('../../src/..'))#指向resources目录

language = 'zh_CN'

extensions = ['sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
    'sphinx.ext.coverage',
    'sphinx.ext.mathjax']

````