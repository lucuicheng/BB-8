---
title: 'iconfont 批量处理'
date: 2020-02-23 10:40:33
tags: 
  - iconfont
  - plugins
---

### 批量添加到购物车
    浏览器控制台中运行一下语句
```javascript
var span = document.querySelectorAll('.icon-cover');
for (var i = 0, len = span.length; i < len; i++) {
     console.log(span[i].querySelector('span').click());
}
```