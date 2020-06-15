Installs Qt (differs by branch name) + other custom versions used in the Seamly2D repository, and linuxqtdeploy v6


```shell
docker run -e EXTRA_BINARIES="" --cap-add SYS_ADMIN --device /dev/fuse -v `pwd`/appdir:/app/usr:Z --rm -ti linuxdeployqt
```

> EXTRA_BINARIES is a space separatered list of binary names; located in /app/usr/bin/ and further passed on
to linuxdeployqt via the executable argument

Because `linuxdeployqt` uses fuse we have to grant it SYS\_ADMIN capabilities and allow access to /dev/fuse.
See https://github.com/docker/for-linux/issues/321
