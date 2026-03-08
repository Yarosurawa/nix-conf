{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.steam
    pkgs.steamcmd
    pkgs.steam-tui
    pkgs.cool-retro-term
    pkgs.spotify
    pkgs.vivaldi
    pkgs.discord
    pkgs.waytrogen
  ];
}
