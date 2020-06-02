---
title: '证书相关'
date: 2020-06-01 10:40:33
tags: 
  - linux
  - cert
---

### 常用证书文件格式说明

### PKCS 
    全称是 Public-Key Cryptography Standards 
    是由 RSA 实验室与其它安全系统开发商为促进公钥密码的发展而制订的一系列标准，PKCS 目前共发布过 15 个标准。 

    常用的有：

    PKCS#7
        也叫做加密消息的语法标准，由RSA安全体系在公钥加密系统中交换数字证书产生的一种加密标准。
        常用的后缀是： .P7B .P7C .SPC
        .p7r: CA对证书请求的回复，只用于导入
        .p7b: 以树状展示证书链(certificate chain)，同时也支持单个证书，不含私钥。
    
    PKCS#10
        描述证书请求语法
        常用的后缀有： .P10
    
    PKCS#12
       描述个人信息交换语法标准。描述了将用户公钥、私钥、证书和其他相关信息打包的语法，2进制方式
       常用的后缀有： .P12 .PFX

### X.509
    是常见通用的证书格式。所有的证书都符合为Public Key Infrastructure (PKI) 制定的 ITU-T X509 国际标准。
    
    X.509 DER 编码(ASCII)的后缀是： .DER .CER .CRT
    X.509 PAM 编码(Base64)的后缀是： .PEM .CER .CRT

    .cer/.crt: 用于存放证书，它是2进制形式存放的，不含私钥。
    .pem: 跟crt/cer的区别是它以Ascii来表示。
