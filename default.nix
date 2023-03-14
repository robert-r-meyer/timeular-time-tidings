# save this as shell.nix
{ pkgs ? import <nixpkgs> {}}:

let
  # Set the version of Ruby to install.
  rubyVersion = "2.7.7";

  gemset = {
    lockfile = ./Gemfile.lock;
  };

in

  pkgs.mkShell {
    name = "timeular";
    imputsFrom = [ pkgs.hello ];

    buildInputs = with pkgs; [
    # Install Ruby 2.7.7.
    ruby_2_7
    bundler
    hello
  ];

    shellHook = ''
    export DEBUG=1
  '';

}
