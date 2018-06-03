#注:低版本gcc镜像可以省下一些空间,但是性能跟依赖未测试. 后续也可自行精简
FROM gcc:8
RUN mkdir /usr/src/mygcc
COPY ./* /usr/src/mygcc
WORKDIR /usr/src/mygcc

#解决java默认用的ansii编码问题,可选ENV CC="ccache gcc" CXX="ccache g++"? 因为默认配置文件没启勇ccache
ENV LANG C.UTF-8
#文档所说的所有直接安装库都装了
RUN apt-get update && apt-get install -y --no-install-recommends realpath \
          ccache \
          openjdk-8-jdk \
         libreadline-dev \
         libboost-all-dev \
        && rm -rf /var/lib/apt/lists/

#RUN java -version
#容器启动时会自动执行make编译，RUN make现在有些问题。
#后续测试脚本可以在这抽出来？或者添加自己需要的步骤（变动尽量步骤靠后）
CMD ["make"]
