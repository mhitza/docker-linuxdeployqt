Installs Qt 9.5.9 (installation version on GitHub ubuntu-latest) and linuxqtdeploy v6


```shell
docker run --cap-add SYS_ADMIN --device /dev/fuse -v `pwd`/appdir:/app/usr:Z --rm -ti linuxdeployqt
```

Because `linuxdeployqt` uses fuse we have to grant it SYS\_ADMIN capabilities and allow access to /dev/fuse.
See https://github.com/docker/for-linux/issues/321
