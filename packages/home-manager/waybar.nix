{config, pkgs, libs, ...}:

let
	colors = import ../colors/main.nix;
in
{
	home.packages = [
			pkgs.waybar-mpris
	];

  programs.waybar = {
    enable = true;
    settings = [{
			position = "top";
			layer = "top";
			spacing = 5;

			modules-left = [ "sway/workspaces" "sway/mode" "hyprland/workspaces"];
			modules-center = [ "clock" ];
			modules-right = [ "battery" "pulseaudio" "network" ];

			"sway/workspaces" = {
				format = "{icon}";
				persistent-workspaces = {
					"1" = [];
					"2" = [];
					"3" = [];
					"4" = [];
					"5" = [];
				};
				format-icons = {
					"1" = "一";
					"2" = "二";
					"3" = "三";
					"4" = "四";
					"5" = "五";
					"6" = "六";
					"7" = "七";
					"8" = "八";
					"9" = "九";
					"10" = "十";
				};
			};

			"hyprland/workspaces" = {
				format = "{icon}";
				persistent-workspaces = {
					"1" = [];
					"2" = [];
					"3" = [];
					"4" = [];
					"5" = [];
				};
				format-icons = {
					"1" = "一";
					"2" = "二";
					"3" = "三";
					"4" = "四";
					"5" = "五";
					"6" = "六";
					"7" = "七";
					"8" = "八";
					"9" = "九";
					"10" = "十";
				};
			};
			network = {
				format = "{ifname}";
				format-wifi = "{ipaddr} ";
				format-disconnected = "nu uh";
				tooltip-format = "{ifname}";
				tooltip-format-wifi = "{essid} ({signalStrength}%) ";
				tooltip-format-ethernet = "{ifname} ";
				tooltip-format-disconnected = "Disconnected";
				max-length= 50;
			};

			battery = {
				interval = 20;
				states = {
				  warning = 20;
				};
				format = "{capacity}%-{icon}";
				format-icons = ["󰁺" "󰁺" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
				format-charging = "{capacity}%-󱎗";
				format-plugged = "{capacity}%-󱎗";
			};

			pulseaudio = {
			  format = "{volume}-󰕾";
				};
		}];
    style = ''
@define-color clr1-prim ${colors.clr1.primary};
@define-color clr2-prim ${colors.clr2.primary};

@define-color bg-prim ${colors.bg.primary};
@define-color bg-sec ${colors.bg.secondary};
@define-color bg-tert ${colors.bg.tertiary};
'' + builtins.readFile ./waybar/style.css;
  };
}
