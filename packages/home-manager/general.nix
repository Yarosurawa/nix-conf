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
		zstd
  ];
}
