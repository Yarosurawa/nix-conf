{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
		nmap
		hydra
		medusa
		ghidra
		# gdb is in prog_langs
		gdb
		sherlock
  ];
}
