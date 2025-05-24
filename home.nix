{ config, pkgs, lib, username, systemArtch, ... }:
{
    home.stateVersion = "23.11";
    home.packages = [
        pkgs.terraform
        pkgs.jq
    ];
}