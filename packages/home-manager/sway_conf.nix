{ config, pkgs, lib, ... }:

let
  mod = "Mod4";
in {

  services.swww = {
    enable = true;
  };

  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 250;
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures = {gtk = true;};

    config = {
      modifier = mod;
      bars = [{ command = "swaybar_command waybar"; }];
      defaultWorkspace = "workspace number 1";

      colors = {
	focused = {
	  background = "#0f0f0f";
	  border = "#eb146b";
	  childBorder = "#eb146b";
	  indicator = "#000000";
	  text = "#ffffff";
	};
      };

      floating.criteria = [ {class = "Pavucontrol";} ];

      gaps = {
        inner = 6;
	outer = 12;
      };

      window = {
	border = 1;
	titlebar = false;
      };

      focus.followMouse = false;
      workspaceAutoBackAndForth = false;

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
    };
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
    style = builtins.readFile ./waybar/style.css;
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

