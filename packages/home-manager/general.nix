{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
		wev
    spotify
		spotify-player
    vivaldi
		chromium
    discord
		telegram-desktop
		whatsapp-electron
		jetbrains.rider
		protonvpn-gui
		bitwarden-desktop
		playerctl
		libreoffice-qt-fresh
		minefair
		unzip
		qimgv
		easyeffects
		colo
  ];
}
