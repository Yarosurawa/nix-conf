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
	services.awww.enable = true;

	qt = {
		enable = true;
		style.name = "adwaita-dark";
	};

	programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      # Background
      screenshots = true;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";

      clock = true;
      timestr = "%H:%M:%S";
      datestr = "%A, %d %B";
      font-size = 36;

      # Password indicator
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 4;

      color = "1e1e2e";
      inside-color = "1e1e2e88";
      inside-clear-color = "1e1e2e88";
      inside-ver-color = "1e1e2e88";
      inside-wrong-color = "1e1e2e88";

      ring-color = colors.clr1.primary;
      ring-clear-color = "f5c2e7";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "f38ba8";

      key-hl-color = colors.clr1.primary;
      bs-hl-color = colors.clr1.primary;
      line-color = colors.clr1.primary;
      separator-color = "00000000";
      text-color = "cdd6f4";

      # Behaviour
      show-failed-attempts = true;
      ignore-empty-password = true;

			grace = 5;
			effect-pixelate = 10;
    };
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
