FROM ubuntu:16.04

ENV QT_SELECT=5

# required by linuxdeployqt
#   fuse, binutils (objdump), libglib2.0-0
RUN apt update && \
      apt install --assume-yes wget fuse binutils libglib2.0-0 software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa && apt update && \
      apt install --assume-yes python3.7 python3-pip && \
      update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
      python3 -m pip install --upgrade pip

RUN pip3 install "aqtinstall==1.1.3"

# Argument defined at this location to maximise layer reuse, as all following RUN statements will
# implicitly use the QT_VERSION argument
ARG QT_VERSION

RUN aqt install $QT_VERSION linux desktop -m all -b https://mirrors.ocf.berkeley.edu/qt \
    && cp -R ./$QT_VERSION/gcc_64/* /usr \
    && rm -rf ./$QT_VERSION

RUN wget https://github.com/probonopd/linuxdeployqt/releases/download/7/linuxdeployqt-7-x86_64.AppImage \
      --quiet --output-document=/usr/bin/linuxdeployqt && \
    chmod +x /usr/bin/linuxdeployqt

# Minimal dependencies required to bundle Seamly2D (mostly GL/printer/font support)
RUN apt update && \
      apt install --assume-yes libgl1-mesa-glx libfontconfig1 libxi6 libdbus-1-3 libxcb-xfixes0 libegl1-mesa libcups2 libxrender1 libxkbcommon-x11-0

# Allow an easy way to bundle utility binaries within the same AppImage.
# For example, binaries called directly by the primary target application
ENV EXTRA_BINARIES ""

COPY builder.sh .
CMD ./builder.sh
