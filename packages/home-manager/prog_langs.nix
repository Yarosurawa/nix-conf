{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lua
    luarocks-nix

    nodejs

    python3
    pipx

    clang
    libgcc
  ];
}
