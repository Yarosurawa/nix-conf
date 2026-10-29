{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

	environment.systemPackages = [
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default # default, beta, twilight, or twilight-official
  ];

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.chopsticks = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/chopsticks/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
    nixosConfigurations.curry = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/curry/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
