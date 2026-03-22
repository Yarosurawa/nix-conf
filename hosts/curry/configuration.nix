# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../packages/nixos/keyd.nix
      ../../packages/nixos/virtualbox.nix
      ../../packages/nixos/usb.nix
      inputs.home-manager.nixosModules.default
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "curry"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [
      pkgs.fcitx5-mozc
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  programs.xwayland.enable = true;

  # XFCE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;
	hardware.graphics.enable32Bit = true;

	# Sway
  programs.sway.enable = true;
  programs.sway.wrapperFeatures.gtk = true;
	
	#Hyprland
	programs.hyprland.enable = true;

	#touchpad
	services.libinput = {
		enable = true;
		touchpad.tapping = true;
	};

  security.polkit.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yaro = {
    isNormalUser = true;
    description = "Yaro";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;

    users.yaro = import ./home.nix;
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ git wget tmux kitty keyd sway i3 home-manager vim neovim killall ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    configPackages = with pkgs; [
      pkgs.xdg-desktop-portal-gtk
    ];
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

	environment.sessionVariables = {
		GTK_THEME = "Adwaita:dark";
	};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
