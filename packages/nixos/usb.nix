{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
		nssmdns
		avahi
		avahi-compat
		uxplay
		rpiplay
	];

	services.avahi = {
		enable = true;
	};
}
