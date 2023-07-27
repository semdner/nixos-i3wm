# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  
  # i3 configuration
  environment.pathsToLink = ["/libexec"]; # Links /libexec from derivations to /run/current-system/sw

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
   
    desktopManager = {
      xterm.enable = false;
    };
    
    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3lock
      ];
    };
  };

  # Configure console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.max = {
    isNormalUser = true;
    description = "Max";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [

    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System Utilities:
    # Includes drivers, filesystem tools, system monitoring, etc.
    alacritty # Terminal Emulator
    polybar # Statusbar (i3status alternative)
    rofi # Tool for searching applications (dmenu alternative)
    wget
    curl
    vim
    brightnessctl # Screen brightness control
    xorg.xev # Tool to capture information about button presses
    toybox # Numerous unix command line utilities
    siji    # Font required for polybar
    unifont # Font required for polybar 
    
    # Network Applications:
    # Includes web browsers, email clients, FTP clients, etc.
    firefox

    # Multimedia Applications:
    # Includes audio control, media players, etc.
    pavucontrol # pulseaudio frontend
    vlc
    feh # image viewer to set background 

    # File Management:
    xfce.thunar
    ranger

    # Security Tools:
    keepassxc
    
    # Development Tools:
    # C/C++
    gcc
    gdb

    # Python
    python3
    python3Packages.pip
    python3Packages.virtualenv
    
    # Version Control
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "23.05"; # Did you read the comment?
  
  # Enable bluetooth
  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.hsphfpd.enable = true;
 
  # Enable sound with PulseAudio
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true; # enable needed for polybar
  
  # Enable screen brightness
  # programs.light.enable = true;

  # Enable sound with PipeWire
  # sound.enable = true;
  # hardware.pulseaudio.enable = false;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   jack.enable = true;
  # };
}
