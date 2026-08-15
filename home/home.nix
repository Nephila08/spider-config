{ config, pkgs, username, ...}:

{

    imports = [

	./modules/kitty.nix
	./modules/fish.nix
	./modules/vesktop.nix

    ];

    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [

	vesktop	
    ];

    programs.git = {

	enable = true;
	settings = {

	    user.name = "Nephila";
	    user.email = "nephila.spider08@gmail.com";
	};
    };
}
