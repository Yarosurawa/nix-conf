{ lib, config, pkgs, ... }:

{
  xdg.configFile."nvim".source = ./nvim;

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

      extraPackages = with pkgs; [
        ripgrep fd

        lua-language-server
        nodePackages.typescript-language-server
        nodePackages.typescript
        nodePackages.vscode-langservers-extracted
        nodePackages.eslint
        nodePackages.prettier
        vue-language-server 
				emmet-ls vtsls
        clang-tools          

        lldb
        gdb
      ];
      plugins = with pkgs.vimPlugins; [
				nvim-lspconfig
				nvim-lsputils
				nvim-vtsls

				alpha-nvim

				mini-icons
				nvim-web-devicons
				neo-tree-nvim

				nvim-cmp
				emmet-vim
				cmp-nvim-lsp
				cmp-buffer
				cmp-path
				luasnip
				cmp_luasnip

				conform-nvim
				nvim-lint
				nvim-dap

				telescope-nvim
				plenary-nvim
				gitsigns-nvim
				which-key-nvim

				nvim-treesitter
				nvim-treesitter.withAllGrammars

				kanagawa-nvim
				kanagawa-paper-nvim
      ];
    };

    fastfetch = {
			enable = true;
			settings = {
				logo =  {
				  type = "file";
					source = "${
						pkgs.writeText "myascii.txt" ''
[38;2;82;119;195m       ◢██◣[38;2;127;183;255m   ◥███◣  ◢██◣
[38;2;82;119;195m       ◥███◣[38;2;127;183;255m   ◥███◣◢███◤
[38;2;82;119;195m        ◥███◣[38;2;127;183;255m   ◥██████◤
[38;2;82;119;195m    ◢████████████[48;2;127;183;255m◣[0m[38;2;127;183;255m████◤[38;2;82;119;195m   ◢◣
[38;2;82;119;195m   ◢██████████████[48;2;127;183;255m◣[0m[38;2;127;183;255m███◣[38;2;82;119;195m  ◢██◣
[38;2;127;183;255m        ◢███◤      ◥███◣[38;2;82;119;195m◢███◤
[38;2;127;183;255m       ◢███◤        ◥██[48;2;82;119;195m◤[0m[38;2;82;119;195m███◤
[38;2;127;183;255m◢█████████◤          ◥[48;2;82;119;195m◤[0m[38;2;82;119;195m████████◣
[38;2;127;183;255m◥████████[48;2;82;119;195m◤[0m[38;2;82;119;195m◣          ◢█████████◤
[38;2;127;183;255m    ◢███[48;2;82;119;195m◤[0m[38;2;82;119;195m██◣        ◢███◤
[38;2;127;183;255m   ◢███◤[38;2;82;119;195m◥███◣      ◢███◤
[38;2;127;183;255m   ◥██◤  [38;2;82;119;195m◥███[48;2;127;183;255m◣[0m[38;2;127;183;255m██████████████◤
[38;2;127;183;255m    ◥◤   [38;2;82;119;195m◢████[48;2;127;183;255m◣[0m[38;2;127;183;255m████████████◤
[38;2;82;119;195m        ◢██████◣[38;2;127;183;255m   ◥███◣
[38;2;82;119;195m       ◢███◤◥███◣[38;2;127;183;255m   ◥███◣
[38;2;82;119;195m       ◥██◤  ◥███◣[38;2;127;183;255m   ◥██◤
						''
					}";
					padding = {
						right = 2;
						top = 2;
					};
				};	
				display = {
					size = {
						binaryPrefix = "si";
					};
					color = "blue";
					separator = "  ";
				};
				modules = [
					{
						type = "datetime";
						key = "Date";
						format = "{1}-{3}-{11}";
					}
					{
						type = "datetime";
						key = "Time";
						format = "{14}:{17}:{20}";
					}
					"break"
					"player"
					"media"
				];
			};
		};

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
