let
  lib =
    { src = ./src;
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
    };
in
  { main = "Main";
    src = ./app;
    packages = [ lib ];
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
  }
