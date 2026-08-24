{
  config,
  pkgs,
  lib,
  colors,
  ...
}:
{
  home.packages = with pkgs; [
    wofi
    ghostty
    grim
    slurp
    wl-clipboard
    hyprpicker
    hyprlock
    wireplumber
    brightnessctl
    playerctl
    jq
    nemo
    imagemagick
    wl-crosshair
  ];

  services = {
    kdeconnect.enable = true;
  };
}
