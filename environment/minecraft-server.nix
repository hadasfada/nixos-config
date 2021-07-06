{ pkgs ? import <nixpkgs> }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ papermc ngrok curl ];
  shellHook = ''
    pushd $HOME/workspace/minecraft-server
    PORT=25565
    IP=""
    ngrok tcp --region eu $PORT &>/dev/null &
    while [ -z "$IP" ]; do
      export IP=$(curl --silent --max-time 10 --connect-timeout 5 \
        http://127.0.0.1:4040/api/tunnels | \
        sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p')
    done
    echo "IP = $IP"
    minecraft-server
    popd
    exit
  '';
}

