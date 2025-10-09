{
  description = "latest release (or pre-release) pinned zed editor builds for binary cache";

  inputs = {
    zed.url = "github:zed-industries/zed/v0.208.1-pre";
  };

  outputs = { zed, ... }: zed.outputs;
}
