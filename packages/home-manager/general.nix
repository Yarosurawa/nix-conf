{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
		prismlauncher
		wev #input check
		obsidian
    discord
		telegram-desktop
		whatsapp-electron
		proton-vpn
		bitwarden-desktop
		playerctl #for controlling the media players 
		libreoffice-qt-stable
		minefair #really wellmade minesweeper
		unzip
		qimgv #img viewer
		easyeffects #voice mixer
		colo # showing what a color looks like in term
		blueman bluez
		kdePackages.dolphin
		zstd
		github-cli
		rmpc # Music Player
		xplr # File Explorer
		mpd 
	  exiftool
		qbittorrent
		mdfried #.md viewer
		opentabletdriver # Tablet driver
		osu-lazer-bin
  ];
}
