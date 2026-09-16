{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
		nmap
		gdb
		sherlock
		whois
		ipinfo
  ];
}
