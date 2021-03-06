{
  description = "Build rust crates in Nix. No configuration, no code generation. IFD and sandbox friendly.";

  edition = 201909;

  outputs = { self, nixpkgs }: let
    forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" "i686-linux" "aarch64-linux" ];
  in {
    # Naersk is not a package, not an app, not a module... It's just a Library
    lib = forAllSystems (system: nixpkgs.legacyPackages."${system}".callPackage ./default.nix {});
  };
}
