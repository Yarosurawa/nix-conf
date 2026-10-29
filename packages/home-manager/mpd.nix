{ config, pkgs, ... }:

{
	services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    # Defaults to ~/.local/share/mpd; override if you like
    # dataDir = "${config.xdg.dataHome}/mpd";
    network = {
      listenAddress = "127.0.0.1";   # or "any" to expose on the LAN
      port = 6600;
    };
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };

  # Optional: MPRIS support so media keys / playerctl work
  services.mpd-mpris.enable = true;

  # Optional clients
  programs.ncmpcpp.enable = true;
  home.packages = [ pkgs.mpc ];   # called mpc-cli on older nixpkgs
}
