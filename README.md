A docker packaged solution for AppImage packaging using [linuxdeployqt](https://github.com/probonopd/linuxdeployqt)

## Motivation

This container was written mostly to automate the AppImage packaging process of the Seamly2D repository. As linuxdeployqt has a strict dependency on a specific version of glibc, it felt easier to use a container instead of settings up Ubuntu 16.04 instances/GitHub runner.

> When the linuxdeployqt mininum version of Ubuntu changes, the images in this repository should get updated. If they aren't, please create an issue.

Installs Qt (differs by branch name) + other custom versions used in the Seamly2D repository, and linuxqtdeploy v6

## Usage

```shell
docker run -e EXTRA_BINARIES="" --cap-add SYS_ADMIN --device /dev/fuse -v `pwd`/appdir:/app/usr:Z --rm -ti linuxdeployqt
```

> EXTRA_BINARIES is a space separatered list of binary names; located in /app/usr/bin/ and further passed on
to linuxdeployqt via the executable argument

Because `linuxdeployqt` uses fuse we have to grant it SYS\_ADMIN capabilities and allow access to /dev/fuse.
See https://github.com/docker/for-linux/issues/321
