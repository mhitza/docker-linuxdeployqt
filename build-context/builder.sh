#!/usr/bin/env bash

cp -R /app/usr/lib*/**/* /usr/lib/

for eb in $EXTRA_BINARIES; do
  extra_binaries+=( -executable=/app/usr/bin/$eb )
done

/usr/bin/linuxdeployqt /app/usr/share/applications/*.desktop -appimage "${extra_binaries[@]}" && \
cp *.AppImage /app/usr/
