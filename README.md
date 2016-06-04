# Upsource
[![](https://badge.imagelayers.io/esycat/upsource:latest.svg)](https://imagelayers.io/?images=esycat/upsource:latest 'Get your own badge on imagelayers.io')

[Upsource](https://jetbrains.com/upsource/) is a repository browsing and code review tool from [JetBrains](https://jetbrains.com/).

Version `3.0.3`, build `4364` (released June 3, 2016).

The image based on [Ubuntu 16.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/upsource
docker create --name upsource -p 8080:8080 --restart=always esycat/upsource
docker start upsource
```
