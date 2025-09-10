{ pkgs ? import <nixpkgs> { } }:

with pkgs;
with beamPackages;

let deps = import ./deps.nix { inherit lib beamPackages; };
in buildMix rec {
  name = "sk";
  src = ./.;
  version = "0.0.0";

  buildInputs = [ erlang elixir ];

  beamDeps = [ deps.toml_elixir deps.calliope ];
}
