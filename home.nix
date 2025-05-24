{ config, pkgs, lib, username, system, ... }:
{
  home.username = "0x53c";
  home.homeDirectory = "/Users/0x53c";
  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["terraform"];
  home.packages = [
    pkgs.git
    pkgs.gnused
    pkgs.gnutar
    pkgs.gnupg
    pkgs.terraform
    pkgs.docker
    pkgs.jq
    pkgs.curl

  ];
  programs.home-manager.enable = true;
}
