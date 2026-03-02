{ config, pkgs, ... }:

{
  programs = {
    cava.enable = true;
    kitty = {
      enable = true;
      enableGitIntegration = true;

      font = {
        name = "FiraCode Nerd Font";
        size = 12;
      };

      settings = {
        confirm_os_window_close = 0;
        background_opacity = "0.6";
        enable_audio_bell = false;
	cursor_trail = 1;
	cursor_trail_decay = "0.1 0.4";
	open_url_with = "vivaldi";
	show_hyperlink_targets = true;
	strip_trailing_spaces = "always";
	sync_to_monitor = false;
	window_padding_width = 6;
      };
    };
    vim = { enable = true; };
    neovim = { 
      enable = true;
      defaultEditor = true;

      waylandSupport = true;
      withNodeJs = true;
      withPython3 = true;


      extraConfig = builtins.readFile ./conf-files/vimrc;
      plugins = with pkgs.vimPlugins; [
        LazyVim
	vim-nix
	nvim-treesitter
	telescope-coc-nvim
      ];
      
      initLua = "require('lazy').setup()";

      coc = {
      	enable = true;
	settings = {
	  "suggest.noselect" = true;
	  "suggest.enablePreview" = true;
	  "suggest.enablePreselect" = false;
	  "suggest.disableKind" = true;
	  languageserver = {
	    haskell = {
	      command = "haskell-language-server-wrapper";
	      args = [ "--lsp" ];
	      rootPatterns = [
		"*.cabal"
		"stack.yaml"
		"cabal.project"
		"package.yaml"
		"hie.yaml"
	      ];
	      filetypes = [ "haskell" "lhaskell" ];
	    };
	  };
	};
      };
    };
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
