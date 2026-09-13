{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby
    bundler
    git

    # Native dependencies used by some Ruby gems.
    pkg-config
    libffi
    libyaml
    openssl
    zlib
  ];

  shellHook = ''
    # Keep gems local to the repository instead of installing them globally.
    export BUNDLE_PATH="$PWD/.bundle"
    export BUNDLE_BIN="$BUNDLE_PATH/bin"
    export PATH="$BUNDLE_BIN:$PATH"

    # Help native Ruby gems find their development libraries.
    export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPath "lib/pkgconfig" [
      pkgs.openssl
      pkgs.libffi
      pkgs.zlib
    ]}:$PKG_CONFIG_PATH"

    echo "The Dungeon Archivist — Jekyll development shell"
    echo
    echo "First run:"
    echo "  bundle install"
    echo
    echo "Start the site:"
    echo "  bundle exec jekyll serve --livereload"
    echo
    echo "Then open: http://127.0.0.1:4000"
  '';
}
