{ config, pkgs, username, hostname, ... }:

{

    imports = [

	./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = hostname;
    networking.networkmanager.enable = true;

    hardware.bluetooth = {

	enable = true;
	powerOnBoot = true;
    };

    services.blueman.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "America/Mazatlan";
    i18n.defaultLocale = "en_US.UTF-8";

    users.users.${username} = {

	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	shell = pkgs.fish;
    };

    programs.fish.enable = true;

    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {

	enable = true;
	alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    programs.firefox.enable = true;
    
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [

	git
	vim
    ];

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
}
