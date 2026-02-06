{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    ext = ({ enabled, all }: enabled);

    mkPhpShell = name: php: {
      "${name}" = pkgs.mkShell {
        name = "${name} Environment";
        buildInputs = [ php php.packages.composer ];
      };
    };
  in
  {
    devShells.x86_64-linux =
      (mkPhpShell "php82" (pkgs.php82.withExtensions ext)) //
      (mkPhpShell "php83" (pkgs.php83.withExtensions ext)) //
      (mkPhpShell "php84" (pkgs.php.withExtensions ext)) //
      (mkPhpShell "php85" (pkgs.php85.withExtensions ext));
  };
}
