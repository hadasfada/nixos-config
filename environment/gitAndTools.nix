{ config ,pkgs , ... }:
{
  programs.git = {
    enable = true;
    userName = "Mustafa Çalışkan";
    userEmail = "musfay@protonmail.com";
    extraConfig = {
      credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
    };
  };

  programs.gh.enable = true;
}
