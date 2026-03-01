{ config, pkgs, ... }:

{
  programs = {
    kitty = {
      enable = true;

      font = {
        name = "FiraCode Nerd Font";
        size = 12;
      };

      settings = {
        confirm_os_window_close = 0;
        background_opacity = "0.6";
        enable_audio_bell = false;
      };
    };
    vim = { enable = true; };
    neovim = { enable = true; };
    fastfetch = { enable = true; };
    git = {
      enable = true;
      settings.user.name = "Yarosurawa";
      settings.user.email = "yarosurawa@gmail.com";
    };

    zsh = {
      enable = true;
      shellAliases = {
        nix_up = "sudo nixos-rebuild switch --flake ~/.config/nix-conf/#chopsticks";
	ff = "fastfetch";
      };
      oh-my-zsh = {
        enable = true;
	plugins = [ "git" "vi-mode" ];
	theme = "robbyrussell";
      };
    }; 
  }; 
}
