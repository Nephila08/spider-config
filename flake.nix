{

    description = "NixOS Config ^v^";

    inputs = {

	nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

	home-manager = {

	    url = "github:nix-community/home-manager/release-26.05";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = inputs @ { self, nixpkgs, home-manager, ... }:

	let
	
	    system = "x86_64-linux";
	    hostname = "spider";
	    username = "nephila";
	in {

	    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {

		inherit system;
		specialArgs = { inherit inputs username hostname; };
		modules = [

		    ./system/configuration.nix
		    home-manager.nixosModules.home-manager
		    {

			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;
			home-manager.extraSpecialArgs = { inherit inputs username; };
			home-manager.users.${username} = import ./home/home.nix;
		    }
		];
	    };
	};
}
