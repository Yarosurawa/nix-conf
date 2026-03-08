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
    clang
    libgcc
    ripgrep
    typescript
  ];
}
