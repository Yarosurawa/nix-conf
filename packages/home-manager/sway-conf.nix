{ config, pkgs, lib, ... }:

let
  mod = "Mod4";
in {
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 250;
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = mod;
      bars = [{ command = "swaybar_command waybar"; }];
      keybindings = lib.attrsets.mergeAttrsList [
        (lib.attrsets.mergeAttrsList (map (num: let
          ws = toString num;
        in {
          "${mod}+${ws}" = "workspace ${ws}";
          "${mod}+Ctrl+${ws}" = "move container to workspace ${ws}";
        }) [1 2 3 4 5 6 7 8 9 0]))

        (lib.attrsets.concatMapAttrs (key: direction: {
            "${mod}+${key}" = "focus ${direction}";
            "${mod}+Ctrl+${key}" = "move ${direction}";
          }) {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          })

        {
          "${mod}+Return" = "exec --no-startup-id ${pkgs.kitty}/bin/kitty";
          "${mod}+Shift+Return" = "exec --no-startup-id wofi --show drun,run";
          "${mod}+b" = "exec vivaldi";

          "${mod}+q" = "kill";

          "${mod}+a" = "focus parent";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+t" = "floating toggle";
          "${mod}+g" = "split h";
          "${mod}+s" = "layout stacking";
          "${mod}+v" = "split v";
          "${mod}+w" = "layout tabbed";

          "${mod}+Shift+r" = "exec swaymsg reload";
          "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "${mod}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
          "${mod}+Ctrl+q" = "exit";
        }
      ];
      focus.followMouse = false;
      workspaceAutoBackAndForth = true;
    };
    systemd.enable = true;
    wrapperFeatures = {gtk = true;};
  };

  programs.waybar = {
    enable = true;
    settings = [{
    	position = "left";
	width = 12;
	layer = "top";

	modules-left = [ "sway/workspaces" "sway/mode" ];
	modules-center = [ "clock" ];
	modules-right = [ "battery" ];

    }];
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

