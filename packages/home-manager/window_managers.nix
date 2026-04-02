{lib, config, pkgs, ...}:
{
	imports = [
		./waybar.nix
		./window-managers/sway.nix
		./window-managers/hyprland.nix
	];

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
		waypaper
  ];

	programs.mpvpaper.enable = true;
	services.swww.enable = true;

	programs.rofi = {
		enable = true;
		location = "top-left";
		terminal = "kitty";

		theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
			"*" = {
				background-color = mkLiteral "#000000";
				foreground-color = mkLiteral "#ffffff";
			};

			"window" = {
				background-color = mkLiteral "#000000";
			};

			"entry" = {
				text-color = mkLiteral "#ffffff";
			};

			"listview" = {
				lines = 10;
				text-color = mkLiteral "#ffffff";
			};

			"element" = {
				text-color = mkLiteral "#ffffff";
			};

			"element selected" = {
				background-color = mkLiteral "#ffffff";
				text-color = mkLiteral "#000000";
			};
		};
	};

  home.file.".hm-graphical-session".text = pkgs.lib.concatStringsSep "\n" [
    "export MOZ_ENABLE_WAYLAND=1"
    "export NIXOS_OZONE_WL=1" # Electron
  ];

  services.cliphist.enable = true;

	services.mako = {
		enable = true;
		settings = {
			"actionable=true" = {
				anchor = "bottom-right";
			};
			actions = true;
			anchor = "top-right";
			background-color = "#000000";
			border-color = "#FFFFFF";
			border-radius = 0;
			default-timeout = 0;
			font = "monospace 10";
			height = 100;
			icons = true;
			ignore-timeout = false;
			layer = "top";
			margin = 10;
			markup = true;
			width = 300;
		};
	};
}
