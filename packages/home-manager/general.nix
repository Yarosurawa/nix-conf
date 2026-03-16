{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    steamcmd
    steam-tui
    cool-retro-term
    spotify
    vivaldi
    discord
    waytrogen
		telegram-desktop
		whatsapp-electron
		jetbrains.rider
  ];
}
