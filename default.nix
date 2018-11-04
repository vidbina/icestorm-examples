{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  name = "ice-setup";
  src = ./.;

  utils = with pkgs; [ which file ];
  buildInputs = with pkgs; [
    arachne-pnr
    icestorm
    yosys
  ] ++ utils;

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
