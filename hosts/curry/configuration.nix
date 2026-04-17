# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
			../global_config.nix
      ../../packages/nixos/keyd.nix
      ../../packages/nixos/virtualbox.nix
      ../../packages/nixos/usb.nix
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "curry"; # Define your hostname.

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yaro = {
    isNormalUser = true;
    description = "Yaro";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

	services.xserver.videoDrivers = ["amdgpu"];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;

    users.yaro = import ./home.nix;
  };

	programs.niri.enable = true;

  environment.systemPackages = with pkgs; [ git wget tmux kitty keyd sway i3 home-manager vim neovim killall ];
}
