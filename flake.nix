{
  description = "latest release (or pre-release) pinned zed editor builds for binary cache";

  inputs = {
    zed.url = "github:zed-industries/zed/v0.207.3";
  };

  outputs = { zed, ... }: zed.outputs;
}
