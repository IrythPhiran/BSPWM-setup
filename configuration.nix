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
  hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  hardware.bluetooth.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  #Nix automatic garbage collection and auto-optimization of the /nix/store
  nix.gc.automatic = true;

  networking.hostName = "Unixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.networkmanager.enable = false;
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
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "/etc/lightdm/wallpaper.jpg";
  };
  services.xserver.displayManager.autoLogin.enable = false;
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
  programs.dconf.enable = true;
  virtualisation.libvirtd.enable = true; # Configure keymap in X11 # services.xserver.xkbOptions = "eurosign:e"; systemd.services.mdmonitor.enable = false; services.flatpak.enable = true; xdg.portal.enable = true; xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];  #Custom Fonts fonts.packages = with pkgs; [ font-awesome ];  # Enable CUPS to print documents.  # services.printing.enable = true;
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jorgeveloso = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "libvirtd" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ 
  clementine 
  arandr 
  htop 
  neofetch 
  screenfetch 
  picom 
  rxvt-unicode 
  feh 
  dmenu 
  gnome.nautilus 
  libsForQt5.dolphin
  cinnamon.nemo
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
  zsh-completions
  zsh-nix-shell
  zsh-autocomplete
  spaceship-prompt
  lxappearance 
  lightdm 
  arc-theme 
  arc-icon-theme 
  mpv 
  vlc 
  numix-cursor-theme 
  killall
  cmatrix
  deluge
  gparted
  gnome.zenity
  openssl
  tree
  gimp
  elinks
  fortune
  nmap
  virt-manager
  gnome.gnome-disk-utility
  efibootmgr
  oneko
  fd
  tldr
  blueman
  gucharmap
  font-awesome
  lemonbar
  sysstat
  ranger
  woeusb
  tcpdump
  roxterm
  sl
  dig
  ntfs3g
  wget
  clamav
  chkrootkit
  yt-dlp
  lsof
  sox
  file
  zip
  unzip
  p7zip
  asciiquarium
  inetutils
  hypnotix
  alock
  rpi-imager
  lftp
  filezilla
  firefox
  ffmpeg
  kitty
  btop
  forge-mtg
  smartmontools
  lm_sensors
  gnome.eog
  haskellPackages.dice
  vscodium
  shellcheck
  rustc
  cargo
  rustup
  lutris
  openshot-qt
  obs-studio
  unrar
  fluent-reader
  gnome-feeds
  cockatrice
  fritzing
  flatpak
  calibre
  wineWowPackages.stable
  wineWowPackages.staging
  winetricks
  ];

    # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services = {
  clamav = {
      daemon.enable=true;
      updater.enable=true;
    };
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.rsyslogd.enable = true;
  #virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  #virtualisation.docker.rootless.enable = true;
  #users.extraGroups.vboxusers.members = [ "jorgeveloso" ];
  # Enable cron service
  # services.cron = {
  #  enable = true;
  #  systemCronJobs = [
  #  ];
  # };
  # Additional auto system upgrades.
  system.autoUpgrade.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #system.stateVersion = "nixos-20.11"; 
  system.stateVersion = "nixos-unstable"; # Did you read the comment?

} 
