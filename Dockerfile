# 使用 Ubuntu 作為基礎映像
FROM ubuntu:20.04

# 設置環境變數
ENV DEBIAN_FRONTEND=noninteractive

# 更新系統並安裝必要的工具
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    default-jdk \
    python3 \
    python3-pip \
    libusb-1.0-0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 下載並安裝 Arduino IDE
RUN wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz \
    && tar -xvf arduino-1.8.19-linux64.tar.xz \
    && rm arduino-1.8.19-linux64.tar.xz \
    && mv arduino-1.8.19 /opt/arduino-1.8.19

# 添加 Arduino IDE 到 PATH
ENV PATH="/opt/arduino-1.8.19:${PATH}"

# 複製當前電腦上的 Arduino 配置和庫
COPY Arduino /root/Arduino

# 設定工作目錄
WORKDIR /root/Arduino

# 啟動命令
CMD ["/opt/arduino-1.8.19/arduino"]

