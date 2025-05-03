# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  #Deprecated but left for... Reasons  
  #hardware.opengl.enable = true;
  #hardware.opengl.driSupport = true;
  #hardware.opengl.driSupport32Bit = true;
  #hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  #hardware.graphics.extraPackages = with pkgs; [ 
  #  amdvlk 
  #  rocmPackages_5.clr.icd
  #  rocmPackages_5.clr
  #  rocmPackages_5.rocminfo
  #  rocmPackages_5.rocm-runtime
  #];
  #ROCM Setup
   # This is necessary because many programs hard-code the path to hip
  #systemd.tmpfiles.rules = [
  #  "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
  #];
  # environment.variables = {
    # As of ROCm 4.5, AMD has disabled OpenCL on Polaris based cards. So this is needed if you have a 500 series card.
  #   ROC_ENABLE_PRE_VEGA = "1";
  #};


  hardware.bluetooth.enable = false;

  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  #Nix automatic garbage collection and auto-optimization of the /nix/store
  nix.gc.automatic = true;

  networking.hostName = "Jupiter"; # Define your hostname.
  networking.extraHosts = ''
  192.168.1.86  Saturn
  192.168.0.104 Saturn
  '';
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.networkmanager.enable = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  };
  console.useXkbConfig = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb.layout = "pt";
  #services.xserver.layout = "pt";
  services.displayManager.defaultSession = "none+bspwm";
  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "/etc/lightdm/wallpaper.jpg";
  };
  services.displayManager.autoLogin.enable = false;
  services.displayManager.autoLogin.user = "jorgeveloso";
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
    syntaxHighlighting.enable = true;
  };
  programs.dconf.enable = true;
  #virtualisation.libvirtd.enable = true; 
  # Configure keymap in X11 # services.xserver.xkbOptions = "eurosign:e"; systemd.services.mdmonitor.enable = false; services.flatpak.enable = true; xdg.portal.enable = true; xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];  #Custom Fonts fonts.packages = with pkgs; [ font-awesome ];  # Enable CUPS to print documents.  # services.printing.enable = true;
  # Enable sound.
  #sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  #hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jorgeveloso = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "libvirtd" "docker" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ 
  clementine 
  arandr 
  htop 
  #neofetch 
  fastfetch
  screenfetch 
  picom 
  rxvt-unicode 
  feh 
  dmenu 
  #nautilus 
  nemo
  chafa 
  vim 
  #pavucontrol 
  pulsemixer
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
  vimix-cursors
  killall
  cmatrix
  deluge
  nicotine-plus
  gparted
  zenity
  openssl
  tree
  gimp
  elinks
  fortune
  nmap
  virt-manager
  gnome-disk-utility
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
  sakura
  sl
  dig
  #ntfs3g
  wget
  #clamav
  chkrootkit
  yt-dlp
  lsof
  sox
  haskellPackages.soxlib
  file
  zip
  unzip
  p7zip
  asciiquarium
  inetutils
  hypnotix
  alock
  rpi-imager
  #lftp
  #filezilla
  firefox
  librewolf
  ffmpeg
  kitty
  btop
  smartmontools
  lm_sensors
  eog
  haskellPackages.dice
  vscodium
  shellcheck
  #rustc
  #cargo
  #rustup
  #obs-studio
  unrar
  #fritzing
  flatpak
  #calibre
  wineWowPackages.stable
  wineWowPackages.staging
  winetricks
  networkmanager
  numlockx
  #cava
  xautoclick
  #crawlTiles
  easyeffects
  alsa-utils
  zulu
  zulu8
  cdesktopenv
  gpt4all
  koboldcpp
  fluent-reader 
  radeontop
  #rocmPackages_5.clr.icd
  #rocmPackages_5.clr
  #rocmPackages_5.rocminfo
  #rocmPackages_5.rocm-runtime
  uqm #The UrQuan Masters
  soundconverter
  ];

  # List services that you want to enable:
  #services.clamav.daemon.enable = true;
  #services.clamav.updater.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.rsyslogd.enable = true;
  #virtualisation.docker.enable = true;
  #virtualisation.docker.rootless.enable = true;
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
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
  networking.firewall.allowedTCPPorts = [ 80 443 36743];
  networking.firewall.allowedUDPPorts = [ 36743 ];
  # Fix for the "Random Seed file" systemd security breach error
  fileSystems."/boot".options = [ "umask=0077" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #system.stateVersion = "nixos-20.11"; 
  #system.stateVersion = "nixos-unstable"; # Did you read the comment?
  #system.stateVersion = "nixos-25.05";
} 
