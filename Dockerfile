FROM ubuntu:latest
CMD ["bash"]
RUN apt update -y && apt upgrade -y && apt install jq wget curl nano screen -y && apt clean
RUN wget https://github.com/Dogenano-xdg/dogenano-node/releases/latest/download/dogenano_node_linux -O doge_node
RUN chmod +x doge_node
RUN mv doge_node /bin/
WORKDIR /root
USER root
RUN mkdir Dogenano
ADD https://raw.githubusercontent.com/MyEcoria/paw-node/main/config/config-rpc.toml Dogenano/
ADD https://raw.githubusercontent.com/MyEcoria/paw-node/main/config/config-node.toml Dogenano/
ENTRYPOINT paw_node --daemon --data_path=/root/Dogenano/
