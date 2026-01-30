# shell.nix
with import <nixpkgs> {};

mkShell {
  name = "jekyll-dev";

  # alle Packages, die Nokogiri & Jekyll brauchen
  buildInputs = [
    ruby
    gcc
    pkg-config
    libxml2
    libxslt
  ];

  # Environment Variables (optional, für Nokogiri)
  shellHook = ''
    echo "Starte Jekyll Dev-Server..."
    if [ -f Gemfile ]; then
      bundle install
      echo "Führe: bundle exec jekyll serve --drafts --incremental"
      bundle exec jekyll serve --drafts --incremental
    else
      echo "Kein Gemfile gefunden. Bitte erst 'bundle init' oder 'bundle install' ausführen."
    fi
  '';
}

