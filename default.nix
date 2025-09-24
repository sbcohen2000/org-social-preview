let
  pkgs = import <nixpkgs> { };
in
pkgs.stdenv.mkDerivation {
  name = "org-social-preview";
  propagatedBuildInputs = [
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
      jinja2
    ]))
  ];
  dontUnpack = true;
  src = ./.;
  # -m sets permissions to executable, -D creates directories, like -p
  # in mkdir.
  installPhase = "install -Dm755 $src/org_social_preview_generator.py $out/bin/org_social_preview_generator";
}
