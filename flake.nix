{
  description = "latest release (or pre-release) pinned zed editor builds for binary cache";

  inputs = {
    zed.url = "github:zed-industries/zed/v0.217.1-pre";
  };

  outputs =
    { zed, ... }:
    zed.outputs
    // {
      overlays.default = final: prev: {
        zed-editor = zed.outputs.packages.${final.system}.default;
      };
    };

  nixConfig = {
    extra-substituters = [
      "https://r3dlust.cachix.org"
      "https://cache.garnix.io"
      "https://zed.cachix.org"
    ];
    extra-trusted-public-keys = [
      "r3dlust.cachix.org-1:/R3S8pW/nr7kOBJKcGPsZ0zCepvldTUEgbrqa4O3cW0="
      "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
}
