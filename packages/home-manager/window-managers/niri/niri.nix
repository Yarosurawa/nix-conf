{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		nautilus
	];

	xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
