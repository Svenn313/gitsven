{ config, lib, ... }:
{
  options.modules.ssh.enable = lib.mkEnableOption "ssh";
  config = lib.mkIf config.modules.ssh.enable {
    services.openssh = {
      enable = true;
      ports  = [ 22923 ];
      settings = {
        PasswordAuthentication       = false;
        X11Forwarding                = false;
        PermitRootLogin              = "no";
        KbdInteractiveAuthentication = false;
      };
    };

    # Dropbear SSH server in initrd, allows remote LUKS unlocking before the
    # system fully boots. Connect with: ssh -p 2222 root@<ip>
    # The LUKS prompt will appear automatically on connection.
    # Once unlocked, the connection closes and the normal boot continues.
    #
    # Before first use, generate the host keys:
    #   sudo mkdir -p /etc/secrets/initrd
    #   sudo ssh-keygen -t ed25519 -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
    #   sudo chmod 600 /etc/secrets/initrd/ssh_host_ed25519_key
    #
    # Before reinstalling, back up the host keys:
    #   sudo cat /etc/secrets/initrd/ssh_host_ed25519_key
    #   sudo cat /etc/secrets/initrd/ssh_host_ed25519_key.pub
    boot.initrd.network = {
      enable = true;
      udhcpc.enable = true; # lightweight DHCP client in initrd
      ssh = {
        enable = true;
        port = 2222; # separate port to distinguish from the main SSH daemon
        authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJiwxiEmpPQsqwx8zvQXRxx0qpVyxdOcTQvIM+kz+/77" ];
        hostKeys = [ "/etc/secrets/initrd/dropbear_key" ]; # dedicated host keys, distinct from the system ones
      };
      # Automatically trigger the LUKS unlock prompt on SSH connection
      postCommands = ''
        echo 'cryptsetup-askpass' >> /root/.profile
      '';
    };
  };
}
