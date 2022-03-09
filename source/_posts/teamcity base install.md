---
title: 'team-city base install'
date: 2019-07-23 10:40:33
tags: 
  - linux
  - docker
  - ci
---

```bash
docker run -it --name youtrack-instance \
-v /opt/youtrack/data:/opt/youtrack/data \
-v /opt/youtrack/conf:/opt/youtrack/conf \
-v /opt/youtrack/logs:/opt/youtrack/logs \
-v /opt/youtrack/backups:/opt/youtrack/backups \
-p 8081:8080 \
jetbrains/youtrack:2022.1.43563
```

```bash
docker run -it --name teamcity-server-instance \
-v /data/teamcity_server/datadir:/data/teamcity_server/datadir \
-v /opt/teamcity/logs:/opt/teamcity/logs \
-p 8111:8111 \
jetbrains/teamcity-server
```

```bash
docker run -it --name eamcity-agent -e SERVER_URL="http://10.0.0.24:8111" \
-v /data/teamcity_agent/conf:/data/teamcity_agent/conf \
jetbrains/teamcity-agent
```

```shell
yum-config-manager -enable 'rhel-7-server-rhui-optional-rpms\*'
```

￼￼