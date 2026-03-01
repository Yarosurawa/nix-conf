{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.spotify
    pkgs.vivaldi
    pkgs.discord
    pkgs.waytrogen
  ];
}
