{lib, config, pkgs, ...}:

let
	colors = import ../colors/main.nix;
in
{
	imports = [
		./waybar.nix
	];

  home.packages = with pkgs; [
    slurp
    wl-clipboard
		waypaper
		libnotify
  ];

	programs.mpvpaper.enable = true;
	services.swww.enable = true;

	qt = {
		enable = true;
		style.name = "adwaita-dark";
	};

	gtk = {
		enable = true;
		colorScheme = "dark";
	};

	services.mako = {
		enable = true;

		settings = {
			font = "JetBrainsMono Nerd Font 10";

			background-color = colors.bg.primary;
			text-color = colors.fg.primary;
			border-color = colors.clr1.primary;

			progress-color = colors.clr1.secondary;

			border-radius = 5;
			border-size = 1;

			padding = "10,15";
			margin = "10";

			default-timeout = 3000;
			ignore-timeout = false;

			anchor = "top-right";
		};
	};

	programs.rofi = {
		enable = true;
		location = "top-left";
		terminal = "kitty";
		theme = "dmenu";
	};

  home.file.".hm-graphical-session".text = pkgs.lib.concatStringsSep "\n" [
    "export MOZ_ENABLE_WAYLAND=1"
    "export NIXOS_OZONE_WL=1" # Electron
  ];

  services.cliphist.enable = true;
}
