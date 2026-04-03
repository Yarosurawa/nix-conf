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
		telegram-desktop
		whatsapp-electron
		jetbrains.rider
		protonvpn-gui
		protonmail-bridge-gui
		bitwarden-desktop
		playerctl
		lxappearance # gtk theme

		minefair
  ];
}
