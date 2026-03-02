{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.steam
    pkgs.cool-retro-term
    pkgs.spotify
    pkgs.vivaldi
    pkgs.discord
    pkgs.waytrogen
  ];
}
