let
  dependencies = [
    "aeson"
    "containers"
    "ekg"
    "formatting"
    "http-client"
    "katip"
    "monad-logger"
    "monad-metrics"
    "mtl"
    "persistent-postgresql"
    "persistent-template"
    "postgresql-simple"
    "postgresql-simple-migration"
    "resource-pool"
    "servant-auth"
    "servant-auth-server"
    "servant-client"
    "servant-js"
    "servant-server"
    "wai-middleware-metrics"
  ];
  lib =
    { inherit dependencies;
      src = ./src;
    };
in
  { main = "Main";
    inherit dependencies;
    src = ./app;
    packages = [ lib ];
  }
