{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    luajit
    luarocks-nix
    nodejs
    python3
		rustc
		cargo
    pipx
		gcc
    ripgrep
		dotnet-sdk
		dotnet-runtime
    typescript

		cowsay
		fortune
		fd
		bc	
		gdb
		nasm
  ];
}
