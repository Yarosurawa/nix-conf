{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
		wev #input check
    spotify
		spotify-player #terminal spotify (meh)
		obsidian
    vivaldi
		chromium
    discord
		telegram-desktop
		whatsapp-electron
		jetbrains.rider
		protonvpn-gui
		bitwarden-desktop
		playerctl #for controlling the media players 
		libreoffice-qt-fresh
		minefair #really wellmade minesweeper
		unzip
		qimgv #img viewer
		easyeffects #voice mixer
		colo # showing what a color looks like in term
		cisco-packet-tracer_9
		blueman bluez
  ];
}
