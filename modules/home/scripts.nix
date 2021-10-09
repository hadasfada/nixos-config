{ pkgs, lib,... }:

let
  ngrokControl = pkg.writeShellScriptBin "ngrokctrl" ''

    createTCPTunnel() {
      port=$1
      tcpTunnel=""
      ${pkgs.ngrok}/bin/ngrok tcp --region eu $port &>/dev/null &
      while [ -z "$tcpTunnel" ]; do
        export ip=$(curl --silent --max-time 10 --connect-timeout 5 \
          http://127.0.0.1:4040/api/tunnels | \
          sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')
      done
      echo $tcpTunnel
    }

    killTCPTunnel() {
      $[lib.getBin pkgs.busybox]/bin/killall ngrok ; exit"
    }

    if
  '';
