----ArduinoIDE 1.8.19 for docker with XQautz-----
1. Install XQaurtz (https://www.xquartz.org/ ; https://github.com/XQuartz/XQuartz/releases/download/XQuartz-2.8.5/XQuartz-2.8.5.pkg ) 
2. 安裝Docker Desktop，下載網址 https://www.docker.com/products/docker-desktop/ ,安裝後啟動Docker Desktop
3. Download All Documents files (Dockerfile, Arduino.tar.gz)

--Command Lines----

open -a Xquartz

xhost +localhost

docker run -it --rm --name arduino-ide \
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    arduino-ide:custom
-------------
