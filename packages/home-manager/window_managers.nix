{lib, config, pkgs, ...}:
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
