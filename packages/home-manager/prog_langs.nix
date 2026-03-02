{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    luajit

    luarocks-nix

    nodejs

    python3
    pipx

    clang
    libgcc
  ];
}
