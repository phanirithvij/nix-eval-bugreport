_: {
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;
  programs.dprint.enable = true;
  programs.dprint.settings = {
    excludes = [
      "**/node_modules"
      "**/*-lock.json"
    ];
    plugins = [
      "https://plugins.dprint.dev/json-0.19.3.wasm"
      "https://plugins.dprint.dev/markdown-0.17.2.wasm"
      "https://plugins.dprint.dev/toml-0.6.2.wasm"
    ];
  };
}
