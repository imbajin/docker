FROM gcc:8
RUN mkdir /usr/src/mygcc
COPY gStore /usr/src/mygcc
WORKDIR /usr/src/mygcc

#解决java默认用的ansii编码问题
ENV LANG C.UTF-8
#文档所说的所有直接安装库都装了
RUN apt-get update && apt-get install -y --no-install-recommends realpath \
          ccache \
          openjdk-8-jdk \
         libreadline-dev \
         libboost-all-dev \
        && rm -rf /var/lib/apt/lists/
#RUN java -version
#（可选）之后可以设置CMD要执行的命令或者其他，由大家自行发挥补充
CMD ["make"]
