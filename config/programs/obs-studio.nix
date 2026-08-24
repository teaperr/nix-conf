{ config, pkgs, ... }:
let
  smartReplayMoverLua = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/SlonickLab/Smart-Replay-Mover/refs/heads/main/Smart%20Replay%20Mover.lua";
    hash = "sha256-JybRSApEZ2W02CcE/d7+WmgZsPgIulYbv6Y1TfvHFrs=";
  };
  smartReplayMoverDb = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/SlonickLab/Smart-Replay-Mover/refs/heads/main/games_database.json";
    hash = "sha256-ySzzPvn8JlWASKhrJZ6JS1AajzqFlOi8mNfZiAfAgx8=";
  };
in
{
  programs.obs-studio = {
    enable = true;
    package = (pkgs.obs-studio.override { cudaSupport = true; });
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-pipewire-audio-capture
    ];
  };

  xdg.configFile."obs-studio/scripts/Smart Replay Mover.lua".source = smartReplayMoverLua;
  xdg.configFile."obs-studio/scripts/games_database.json".source = smartReplayMoverDb;

  home.packages = [ pkgs.xorg.xprop ];
}
