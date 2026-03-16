{ lib, config, pkgs, ... }:

{
  xdg.configFile."nvim".source = ./nvim;

  programs = {
    cava = {
			enable = true;
			settings = {
				general.framerate = 120;
				smoothing.noise_reduction = 88;
				color = {
					background = "'#000000'";
					foreground = "'#eb146b'";
				};
			};
		};
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

      extraPackages = with pkgs; [
        ripgrep fd

        lua-language-server
        nodePackages.typescript-language-server
        nodePackages.typescript
        nodePackages.vscode-langservers-extracted
        nodePackages.eslint
        nodePackages.prettier
        vue-language-server 
				vue
				emmet-ls vtsls
        clang-tools          
				rust-analyzer
				pyright

				rustfmt
				black
				isort

        lldb
        gdb
      ];
      plugins = with pkgs.vimPlugins; [
				nvim-treesitter
				nvim-treesitter.withAllGrammars
				nerdcommenter

				nvim-lspconfig
				nvim-lsputils
				nvim-vtsls
				autoclose-nvim

				alpha-nvim

				bufferline-nvim

				mini-icons
				nvim-web-devicons
				neo-tree-nvim

				nvim-cmp
				cmp-nvim-lsp
				cmp-buffer
				cmp-path
				luasnip
				cmp_luasnip

				vim-vue-plugin
				vim-vue

				conform-nvim
				nvim-lint
				nvim-dap
				nvim-notify
				noice-nvim

				lualine-nvim

				telescope-nvim
				plenary-nvim
				gitsigns-nvim
				which-key-nvim


				kanagawa-nvim
				kanagawa-paper-nvim
      ];
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
        nix_test = "sudo nixos-rebuild test --flake ~/.config/nix-conf/#chopsticks";
				ff = "fastfetch";
      };
      oh-my-zsh = {
        enable = true;
				plugins = [ "git" "vi-mode" ];
				theme = "darkblood";
			};
    }; 

    tmux = {
			enable = true;
			baseIndex = 1;
			prefix = "C-a";
			mouse = true;
			shell = "${pkgs.zsh}/bin/zsh"; 
			extraConfig = builtins.readFile ./tmux/tmux.conf; 
    };

    btop.enable = true;
  }; 
}
