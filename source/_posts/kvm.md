---
title: 'KVM 相关命令'
date: 2019-3-23 10:40:33
tags: jvm
---

###  kvm 相关命令

```shell
kvm -m 1024 -cdrom cn_windows_7_ultimate_with_sp1_x86_dvd_618763.iso -drive file=win7.qcow2,if=virtio,boot=on -fda virtio-win-0.1.102_amd64.vfd -boot d -nographic -vnc :3
wget https://fedorapeople.org/groups/virt/virtio-win/virtio-win.repo \ -O /etc/yum.repos.d/virtio-win.repo
dnf install virtio-win
dnf --enablerepo=virtio-win-latest upgrade virtio-win
```

