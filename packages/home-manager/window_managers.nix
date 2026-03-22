{lib, config, pkgs, ...}:
{
	imports = [
		./waybar.nix
		./window-managers/sway.nix
		./window-managers/hyprland.nix
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

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako # notifications
  ];
}
