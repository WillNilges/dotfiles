{ config, lib, ... }:
let
  inherit (lib) types;
  cfg = config.wilnil.system;
in
{
  options.wilnil.system = {
    primaryDrive = lib.mkOption {
      type = types.str;
      # default = ""; # Will throw error w/o default
    };
  };


  config = {
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = cfg.primaryDrive;
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "512M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted";
                  # disable settings.keyFile if you want to use interactive password entry
                  #passwordFile = "/tmText File.txtp/secret.key"; # Interactive
                  #settings = {
                  #  allowDiscards = true;
                  #  keyFile = "/tmp/secret.key";
                  #};
                  #additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = {
                      "/root" = {
                        mountpoint = "/";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/home" = {
                        mountpoint = "/home";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/nix" = {
                        mountpoint = "/nix";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/swap" = {
                        mountpoint = "/.swapvol";
                        swap.swapfile.size = "32G";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
