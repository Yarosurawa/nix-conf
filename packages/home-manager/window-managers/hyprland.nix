{config, pkgs, ...}:

let
	colors = import ../../colors/main.nix;
	wbar_toggle = pkgs.writeShellScriptBin "wbar_toggle" ''
if pgrep waybar >/dev/null; then
	pkill waybar
else
	${pkgs.waybar}/bin/waybar
fi
	'';
in
{
	home.packages = [
		wbar_toggle
		pkgs.hyprshot
		pkgs.hyprpicker
	];

	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		xwayland.enable = true;

		settings = {
			"$mod" = "SUPER";
			"$term" = "kitty";
			"$explorer" = "thunar";
			"$menu" = "rofi -show drun";
			"exec-once" = "waybar";
			
			general = {
				"gaps_in" = "5";
				"gaps_out" = "10";

				"col.active_border" = "${colors.hypr_rgba colors.clr1.primary "ff"} ${colors.hypr_rgba colors.clr1.primary "44"} 20deg";
			};

			# Binds 
			bind = [

				# Apps
				"$mod, RETURN, exec, $term"
				"$mod, E, exec, $explorer"
				"$mod, B, exec, vivaldi"
				"$mod SHIFT, B, exec, wbar_toggle"
				"SUPER SHIFT, code:201, exec, $term btop"
				"$mod, menu, exec, discord"
				"$mod, P, exec, hyprpicker -a"

				", XF86Launch7, exec, hyprshot -m region --clipboard-only"
				"SHIFT, XF86Launch7, exec, hyprshot -m window -m active --clipboard-only"
				"CONTROL, XF86Launch7, exec, hyprshot -m output -m active --clipboard-only"
				"ALT, XF86Launch7, exec, hyprshot -m region -o $HOME/Pictures/Screenshots"
				"ALT SHIFT, XF86Launch7, exec, hyprshot -m window -m active -o $HOME/Pictures/Screenshots"
				"ALT CONTROL, XF86Launch7, exec, hyprshot -m output -m active -o $HOME/Pictures/Screenshots"

				# Window Operatin
				"bind = $mod, left, movefocus, l"
				"bind = $mod, right, movefocus, r"
				"bind = $mod, up, movefocus, u"
				"bind = $mod, down, movefocus, d"

				"bind = $mod SHIFT, left, swapwindow, l"
				"bind = $mod SHIFT, right, swapwindow, r"
				"bind = $mod SHIFT, up, swapwindow, u"
				"bind = $mod SHIFT, down, swapwindow, d"

				"$mod, Q, killactive,"
				"$mod, T, togglefloating,"
				"$mod, F, fullscreen,"
				"$mod SHIFT, RETURN, exec, $menu"
				"$mod SHIFT, P, pseudo,"
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
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send \"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\""
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send \"$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)\""
				",XF86AudioPlay, exec, playerctl play-pause"
				",XF86AudioPrev, exec, playerctl previous"
				",XF86AudioNext, exec, playerctl next"
			];


			bindel = [
				",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
				",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			];


			decoration = {
				rounding = "0";
				inactive_opacity = "0.9";

				blur = {
					enabled = true;
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
				"windowsMove,   1,     3.5,   easeOutQuint"
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
	};
}
