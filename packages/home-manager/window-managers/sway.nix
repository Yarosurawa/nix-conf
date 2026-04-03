{ config, pkgs, lib, ... }:

let
  mod = "Mod4";
in {
	home.packages = with pkgs; [
		grim
	];

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

			input = {
				"type:touchpad" = {
					tap = "enabled";
				};
			};

      gaps = {
        inner = 4;
				top = 2;
				outer = 8;
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

					"${mod}+Shift+Left" = "resize shrink width 20px";
					"${mod}+Shift+h" = "resize shrink width 20px";
					"${mod}+Shift+Down" = "resize grow height 20px";
					"${mod}+Shift+j" = "resize grow height 20px";
					"${mod}+Shift+Up" = "resize shrink height 20px";
					"${mod}+Shift+k" = "resize shrink height 20px";
					"${mod}+Shift+Right" = "resize grow width 20px";
					"${mod}+Shift+l" = "resize grow width 20px";

          "${mod}+Return" = "exec --no-startup-id ${pkgs.kitty}/bin/kitty";
          "${mod}+Shift+Return" = "exec rofi -show drun";
          "${mod}+b" = "exec vivaldi";
          "${mod}+e" = "exec thunar";

          "${mod}+q" = "kill";

          "${mod}+a" = "focus parent";
          "${mod}+v" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+t" = "floating toggle";
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";

          "${mod}+Shift+r" = "exec swaymsg reload";
          "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "${mod}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
          "${mod}+Ctrl+q" = "exit";
        }
      ];
    };
  };
}

