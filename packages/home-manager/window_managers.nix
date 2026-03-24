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
  ];

  services.swww = {
    enable = true;
  };

	programs.rofi = {
		enable = true;
		location = "top-left";
		theme = "DarkBlue";
		terminal = "kitty";
		plugins = with pkgs; [rofi-calc rofi-vpn];
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
