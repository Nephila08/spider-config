{ pkgs, ... }:

    let

	theme = import ./theme.nix;
    in
{

    programs.kitty = {

	enable = true;
	settings = {

      	    background = theme.black;
      	    foreground = theme.white;
      	    cursor = theme.gold;
      	    selection_background = theme.blueGray;
      	    color0 = theme.black;
      	    color1 = theme.red;
      	    color2 = theme.gold;
      	    color4 = theme.blueGray;
      	    background_opacity = "0.95";
	};
    };
}
