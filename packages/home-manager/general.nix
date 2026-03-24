{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    steamcmd
    steam-tui
    cool-retro-term
		wev
    spotify
    vivaldi
    discord
    waytrogen
		telegram-desktop
		whatsapp-electron
		jetbrains.rider
		protonvpn-gui
		protonmail-bridge-gui
		bitwarden-desktop
		playerctl
  ];
}
