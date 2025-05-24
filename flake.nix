{
    description = "Home Manager Config"
    inputs = {
        nikpkgs.url = "github.com.NixOS/nixpkgs/nixos-23.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager }:
        let
            username = "0x53c";
            system-arm = "aarch64-darwin";
            mkHomeConfig = systemArch: home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${systemArch};
                extraSpecialArgs = { inherit username systemArch; };
                modules = [
                    ./home.nix
                ];
            };
        in
        {
            homeConfigurations."${username}@${systemArch}" = mkHomeConfig systemArch;
        }
}