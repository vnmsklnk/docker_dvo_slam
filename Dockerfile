FROM optsolution/ros-vnc:fuerte

MAINTAINER Chen Wang<mr_cwang@foxmail.com>

RUN apt-get update \
	&& apt-get install -y libsuitesparse-dev \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY . /root/fuerte_workspace/dvo_slam/

RUN rosws init ~/fuerte_workspace /opt/ros/fuerte \
    && cd ~/fuerte_workspace \
    && rosws set -y ~/fuerte_workspace/dvo_slam \
    && /bin/bash -l -c "source ~/fuerte_workspace/setup.bash && \
            cd ~/fuerte_workspace && \
            rosmake dvo_core dvo_ros dvo_slam dvo_benchmark"

RUN /bin/bash -c "echo 'source ~/fuerte_workspace/setup.bash' >> ~/.bashrc"