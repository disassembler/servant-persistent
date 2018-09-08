with import <nixpkgs> {};

let
  hpkgs = haskellPackages.override {
    overrides = self: super: {
    };
  };
  ghc = hpkgs.ghcWithPackages (p: with p; [
    aeson
    containers
    ekg
    formatting
    http-client
    katip
    monad-logger
    monad-metrics
    mtl
    persistent-postgresql
    persistent-template
    postgresql-simple
    postgresql-simple-migration
    resource-pool
    servant-auth
    servant-auth-server
    servant-client
    servant-js
    servant-server
    wai-middleware-metrics
  ]);
in runCommand "servant-persistent" { buildInputs = [ ghc hpkgs.ghcid ]; } ''
  cp -vr ${./.} ./app
  mkdir -pv $out/bin
  chmod -R +w .
  find ./
  cd app/src
  ghc ../app/Main.hs -o $out/bin/servant-persistent
  ${binutils-unwrapped}/bin/strip $out/bin/servant-persistent
  patchelf --shrink-rpath $out/bin/servant-persistent
''
