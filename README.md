# Upsource
[![](https://images.microbadger.com/badges/image/esycat/upsource.svg)](https://microbadger.com/images/esycat/upsource "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/esycat/upsource.svg)](https://microbadger.com/images/esycat/upsource "Get your own version badge on microbadger.com")

[Upsource](https://jetbrains.com/upsource/) is a repository browsing and code review tool from [JetBrains](https://jetbrains.com/).

Version `3.0.6`, build `4421` (released September 14, 2016).

The image based on [Ubuntu 16.04 LTS](https://registry.hub.docker.com/u/esycat/java/) with [Oracle Java 8](https://registry.hub.docker.com/u/esycat/java/).

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/upsource
docker create --name upsource -p 8080:8080 --restart=always esycat/upsource
docker start upsource
```
