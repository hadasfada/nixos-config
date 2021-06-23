{ pkgs, lib, ... }:

{
  services.minecraft-server = {
    enable = true;
    declarative = true;
    eula = true;
    package = pkgs.papermc;
    serverProperties = {
      server-port = 25565;
      difficulty = 3;
      max-players = 5;
      motd = "Helal";
    };
  };

}
