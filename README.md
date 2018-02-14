**Attention**:
The image has been reworked to use Alpine instead of Ubuntu. As a consequence, the UID of the user that the application process runs under has changed from `999` (which was the default in Ubuntu) to `500`. Thereby, if you mount a host directory to persist data and configs, you will need to `chown -R 500:500` your local files before switching to the new version.

# Upsource
[![](https://images.microbadger.com/badges/image/esycat/upsource.svg)](https://microbadger.com/images/esycat/upsource "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/esycat/upsource.svg)](https://microbadger.com/images/esycat/upsource "Get your own version badge on microbadger.com")

[Upsource](https://jetbrains.com/upsource/) is a repository browsing and code review tool from [JetBrains](https://jetbrains.com/).

Version `2017.3`, build `2774` (released February 6, 2018).

The image is based on [Alpine 3.4 with OpenJDK JRE 8](https://hub.docker.com/r/esycat/java/).

## Persistent Data
Upsource is configured to store all data (including backups, logs and temporary files) under `/var/lib/upsource` directory, which is also a Docker volume. In addition, `/opt/upsource/conf` directory is used for configuration files.

There are multiple approaches to handling persistent storage with Docker. For detailed information, see [Manage data in containers](https://docs.docker.com/engine/tutorials/dockervolumes/).

If a host directory is used, it should be writable by the application process, which runs as UID `500`.

## Usage

Pull the image, create a new container and start it:

```bash
docker pull esycat/upsource
docker create --name upsource -p 8080:8080 --restart=always esycat/upsource
docker start upsource
```

## Virtual Host
Typically, we would like to run the Upsource behind a lightweight HTTP server. [`etc/nginx`]() contains an example virtual host configuration for Nginx.
