{ pkgs, ... }: {

  users = {
    defaultUserShell = pkgs.fish;

    users.melbine = {
      isNormalUser = true;
      description = "Melbine";
      home  = "/home/melbine";
      extraGroups = [ "networkmanager" "wheel"];
      packages = with pkgs; [];
    };
  };

  # Uncomment for enable automatic login for the user
  # services.getty.autologinUser = "melbine";
}
