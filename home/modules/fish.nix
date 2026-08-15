{ ... }:

{

    programs.fish = {

	enable = true;
	shellAliases = {

	    rebuild = "sudo nixos-rebuild switch --flake ~/spider-config#spider";
	    update = "nix flake update ~/spider-config";

	    ".." = "cd ..";
	    "..." = "cd ../..";

	    ll = "ls -la";
	    mkdir = "mkdir -p";
	};

	interactiveShellInit = ''

	    set fish_greeting "🕷️"
	'';
    };
}
