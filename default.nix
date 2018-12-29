{ stdenv, pkgs }:

# Run as non-pure shell by just invoking `nix-shell`  instead of
# `nix-shell --pure` since there are some Qt dependencies that can cause
# trouble i.e.: libxcb can't be found in pure mode and if QT_QPA_PLATFORM_PATH
# has been defined to point towards a path that contains the libxcb lib, a
# QXcbIntegration error is thrown stating "Cannot create platform offscreen
# surface, neither GLX nor EGL are enabled"
stdenv.mkDerivation rec {
  name = "ice-setup";
  src = ./.;

  utils = with pkgs; [ which file ];
  buildInputs = with pkgs; [
    arachne-pnr
    icestorm
    nextpnr
    yosys
  ] ++ utils;

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
