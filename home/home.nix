{ config, pkgs, username, ...}:

{

    imports = [

	./modules/kitty.nix
	./modules/fish.nix

    ];

    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [

	vesktop

	yt-dlp
	ffmpeg

	libreoffice
	blender
	vscode	
    ];

    programs.git = {

	enable = true;
	settings = {

	    user.name = "Nephila";
	    user.email = "nephila.spider08@gmail.com";
	};
    };
}
