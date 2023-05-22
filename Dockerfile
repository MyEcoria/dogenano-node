FROM ubuntu:latest
CMD ["bash"]
RUN apt update -y && apt upgrade -y && apt install jq wget curl nano screen -y && apt clean
RUN wget https://github.com/MyEcoria/dogenano-V25/releases/download/V25/doge_node -O doge_node
RUN chmod +x doge_node
RUN mv doge_node /bin/
WORKDIR /root
USER root
RUN mkdir Dogenano
ADD https://raw.githubusercontent.com/MyEcoria/dogenano-node/main/config-node.toml Dogenano/
ADD https://raw.githubusercontent.com/MyEcoria/dogenano-node/main/config-rpc.toml Dogenano/
ENTRYPOINT doge_node --daemon --data_path=/root/Dogenano/
