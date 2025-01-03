{
  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        enableDefaultExcludes = true;
        programs = {
          actionlint.enable = true;
          deadnix.enable = true;
          nixfmt.enable = true;
          prettier.enable = true;
          shfmt.enable = true;
          statix.enable = true;
        };
        settings.global.excludes = [
          ".devenv/*"
          ".direnv/*"
          ".sl/*"
          "LICENSE"
        ];
      };
      devenv.shells.default = {
        pre-commit.hooks.flake-checker.enable = true;
        containers = pkgs.lib.mkForce { };
        languages.nix.enable = true;
        cachix = {
          enable = true;
          push = "shikanime";
        };
        packages = [
          pkgs.gh
        ];
      };
    };
}
