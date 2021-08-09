{ config ,pkgs , ... }:
{
  programs.git = {
    enable = true;
    userName = "Mustafa Çalışkan";
    userEmail = "musfay@protonmail.com";
    signing.signByDefault = true;
    signing.key = null;
    extraConfig = {
      credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
    };
  };
}
