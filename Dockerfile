FROM ros:kinetic

LABEL authors = "Yu Okamoto <yu.okamoto@rapyuta-robotics.com>"

# install base software
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-kinetic-rosbridge-server 

CMD ["roslaunch rosbridge_server rosbridge_websocket.launch"]

EXPOSE 9090

# add entrypoint
COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]