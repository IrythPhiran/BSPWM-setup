# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  networking.hostName = "Unixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.layout = "us";
  services.xserver.displayManager.defaultSession = "none+bspwm";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "jorgeveloso";
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.deviceSection = ''Option "TearFree" "true"'';
  services.gvfs.enable = true;
  services.picom = {
    enable = true;
    vSync = true;
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.zsh.enable = true;
    programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "vim";
    };
    enableCompletion = true;
    autosuggestions.enable = true;
  };
  programs.steam.enable = true;
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true;
  # Configure keymap in X11
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jorgeveloso = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ 
  clementine 
  arandr 
  htop 
  neofetch 
  screenfetch 
  chromium 
  picom 
  kitty 
  rxvt-unicode 
  feh 
  dmenu 
  gnome.nautilus 
  chafa 
  vim 
  pavucontrol 
  qutebrowser 
  flameshot 
  bspwm 
  sxhkd 
  discord 
  zsh 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  lxappearance 
  lightdm 
  arc-theme 
  arc-icon-theme 
  youtube-dl 
  mpv 
  vlc 
  numix-cursor-theme 
  xarchiver
  lutris
  killall
  xdelta
  cmatrix
  deluge
  gnome.file-roller
  gparted
  gnome.zenity
  openssl
  pythonFull
  tree
  gimp
  pcsx2
  elinks
  steam
  fortune
  nmap
  virt-manager
  gnome.gnome-disk-utility
  efibootmgr
  firefox
  oneko
  shotcut
  fd
  tldr
  ion
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
  services.openssh.enable = false;
  # Enable cron service
  # services.cron = {
  #  enable = true;
  #  systemCronJobs = [
  #  ];
  # };
  # Additional auto system upgrades.
  system.autoUpgrade.enable = true;
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
  system.stateVersion = "nixos-unstable"; # Did you read the comment?

} 
