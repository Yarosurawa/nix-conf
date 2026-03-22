{config, pkgs, ...}:

{
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		xwayland.enable = true;

		settings = {
			
			"monitor" = "eDP-1, 1920x1200@144, 0x0, 1";

			# Consts
			"$mod" = "SUPER";
			"$term" = "kitty";
			"$explorer" = "thunar";
			"$menu" = "rofi -show drun";

			# Autostart
			"exec-once" = "waybar";
			
			general = {
				"gaps_in" = "5";
				"gaps_out" = "10";

				"col.active_border" = "rgba(f12354ff) rgba(f1235433) 20deg";
			};

			# Binds 
			bind = [

				# Apps
				"$mod, RETURN, exec, $term"
				"$mod, E, exec, $explorer"
				"$mod, B, exec, vivaldi"
				"SUPER SHIFT, code:201, exec, $term btop"
				"$mod, menu, exec, discord"

				", Print, exec, grim"

				# Window Operatins
				"$mod, Q, killactive,"
				"$mod, T, togglefloating,"
				"$mod, F, fullscreen,"
				"$mod SHIFT, RETURN, exec, $menu"
				"$mod, P, pseudo,"
				"$mod, J, layoutmsg, togglesplit"

				"$mod, S, togglespecialworkspace, magic"
				"$mod SHIFT, S, movetoworkspace, special:magic"


			]++(builtins.concatLists (builtins.genList (i:
				let ws = i;
				in [
					"$mod, ${toString ws}, workspace, ${ if (ws == 0) then "10" else toString ws}"
					"$mod SHIFT, ${toString ws}, movetoworkspace, ${ if (ws == 0) then "10" else toString ws}"
				]
			)9));

			# Mouse movements
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod ALT, mouse:272, resizewindow"
			];

			bindl = [
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioPlay, exec, playerctl play-pause"
				",XF86AudioPrev, exec, playerctl previous"
				",XF86AudioNext, exec, playerctl next"
			];


			bindel = [
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
				",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			];


			decoration = {
				rounding = "10";

				blur = {
					enabled = true;
					size = "5";
				};
			};

			animations = {
				enabled = true;
			};

			bezier = [
				"easeOutQuint,   0.23, 1,    0.32, 1"
				"easeInOutCubic, 0.65, 0.05, 0.36, 1"
				"linear,         0,    0,    1,    1"
				"almostLinear,   0.5,  0.5,  0.75, 1"
				"quick,          0.15, 0,    0.1,  1"
			];

			animation = [
				# Default animations, see https://wiki.hypr.land/Configuring/Animations/
				"global,        1,     10,    default"
				"border,        1,     5.39,  easeOutQuint"
				"windows,       1,     4.79,  easeOutQuint"
				"windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
				"windowsOut,    1,     1.49,  linear,       popin 87%"
				"fadeIn,        1,     1.73,  almostLinear"
				"fadeOut,       1,     1.46,  almostLinear"
				"fade,          1,     3.03,  quick"
				"layers,        1,     3.81,  easeOutQuint"
				"layersIn,      1,     4,     easeOutQuint, fade"
				"layersOut,     1,     1.5,   linear,       fade"
				"fadeLayersIn,  1,     1.79,  almostLinear"
				"fadeLayersOut, 1,     1.39,  almostLinear"
				"workspaces,    1,     3,  easeInOutCubic, slide"
				"workspacesIn,  1,     3,  easeInOutCubic, slide"
				"workspacesOut, 1,     3,  easeInOutCubic, slide"
				"zoomFactor,    1,     4,     quick"
			];
		};

		submaps = {
		 move_focus.settings = {
				bind = [
					", h, movefocus, l"
					", j, movefocus, d"
					", k, movefocus, u"
					", l, movefocus, r"

					", escape, submap, reset"
				];
			};
		};

	};
}
