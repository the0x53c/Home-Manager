{
  description = "My Home Manager Configuration for macOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      primaryUsername = "0x53c";
      system-arm = "aarch64-darwin";
      mkHomeConfig = { system, username }: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit username system; };
        
        modules = [
          ./home.nix
        ];
      };

    in
    {
      homeConfigurations."${primaryUsername}@${system-arm}" = mkHomeConfig {
        system = system-arm;
        username = primaryUsername;
      };
    };
}
