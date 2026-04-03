{config, pkgs, libs, ...}:
{

	home.packages = with pkgs;[
			waybar-mpris
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
    style = builtins.readFile ./waybar/style.css;
  };
}
