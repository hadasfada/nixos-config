#!/usr/bin/env bash

createTCPTunnel() {
    port=$1
    tcpTunnel=""
    ngrok tcp --region eu $port &>/dev/null &
    while [ -z "$tcpTunnel" ]; do
      export ip=$(curl --silent --max-time 10 --connect-timeout 5 \
        http://127.0.0.1:4040/api/tunnels | \
        sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')
    done
    echo $tcpTunnel
}

killTCPTunnel() {
    nix-shell -p busybox \
        --command "killall ngrok ; exit"
}
