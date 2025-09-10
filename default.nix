{ pkgs ? import <nixpkgs> { } }:

with pkgs;
with beamPackages;

let deps = import ./deps.nix { inherit lib beamPackages; };
in buildMix rec {
  name = "sk";
  src = ./.;
  version = "0.0.0";

  buildInputs = [ pkgs.erlang pkgs.elixir_1_17 ];

  beamDeps = [ deps.toml_elixir deps.calliope ];
}
