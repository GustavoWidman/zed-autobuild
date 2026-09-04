{
  description = "latest release (or pre-release) pinned zed editor builds for binary cache";

  inputs = {
    zed.url = "github:zed-industries/zed/v1.19.1-pre";
  };

  outputs =
    { zed, ... }:
    let
      cargoLock = builtins.fromTOML (builtins.readFile "${zed.outPath}/Cargo.lock");
      gitSourceKeys = builtins.attrNames (
        builtins.listToAttrs (
          builtins.map
            (source: {
              name = source;
              value = null;
            })
            (
              builtins.filter (source: source != null && builtins.match "git\\+.*" source != null) (
                builtins.map (package: package.source or null) cargoLock.package
              )
            )
        )
      );

      knownOutputHashes = {
        "git+https://github.com/KillTheMule/nvim-rs?rev=764dd270c642f77f10f3e19d05cc178a6cbe69f3#764dd270c642f77f10f3e19d05cc178a6cbe69f3" = "sha256-cnG18TL/L4NUze4ltz4IKo2uLhuRwmwZd/yNWrCweC4=";
        "git+https://github.com/RustAudio/rodio?rev=e50e726ddd0292f6ef9de0dda6b90af4ed1fb66a#e50e726ddd0292f6ef9de0dda6b90af4ed1fb66a" = "sha256-3TO3MkeSDAQc751aKLCQBJDVDsVc2RWCVqctujs5Qxg=";
        "git+https://github.com/camdencheek/tree-sitter-go-mod?rev=2e886870578eeba1927a2dc4bd2e2b3f598c5f9a#2e886870578eeba1927a2dc4bd2e2b3f598c5f9a" = "sha256-OfhV3lxdyIhA3XZYbafEtdOsQsTCSSCBrN3WbzSVg0g=";
        "git+https://github.com/microsoft/python-environment-tools.git?rev=bb8e04607b96a3865d6aa4bb2a5a5a82ce05b5f0#bb8e04607b96a3865d6aa4bb2a5a5a82ce05b5f0" = "sha256-7pLp0Ypm2hYC6PEQIBprPE/rpWm934P8j0mTaxUs298=";
        "git+https://github.com/proptest-rs/proptest?rev=3dca198a8fef1b32e3a66f1e1897c955b4dc5b5b#3dca198a8fef1b32e3a66f1e1897c955b4dc5b5b" = "sha256-p5NTcHhruI8QQvANACg8AMRVNmuvGxs2NLit+/8PaWo=";
        "git+https://github.com/smol-rs/async-task.git?rev=b4486cd71e4e94fbda54ce6302444de14f4d190e#b4486cd71e4e94fbda54ce6302444de14f4d190e" = "sha256-+ee4Mqd/Uj8Ki3Vjo6U9gtpZnuFeJtji5kgH3u3IBrA=";
        "git+https://github.com/tree-sitter/tree-sitter-cpp?rev=5cb9b693cfd7bfacab1d9ff4acac1a4150700609#5cb9b693cfd7bfacab1d9ff4acac1a4150700609" = "sha256-s9/n09EruafAMF3g6xOkfu6L+WXUx83PpcVKn1Tnmg8=";
        "git+https://github.com/tree-sitter/tree-sitter?rev=43623ec9bf0eaaf7113285c46e8a09018f181b18#43623ec9bf0eaaf7113285c46e8a09018f181b18" = "sha256-tDZzadbSmuf4bqoExdmH+4mg9WBGrzJ52VnXra13ydg=";
        "git+https://github.com/zed-industries/alacritty?rev=4c129667ce56611becdc82de6e28218c80e2e88f#4c129667ce56611becdc82de6e28218c80e2e88f" = "sha256-fhd6tMhgkuoCTzJLyYa2iL7wjNMWeztfAf2qjsGyQAM=";
        "git+https://github.com/zed-industries/async-pipe-rs?rev=82d00a04211cf4e1236029aa03e6b6ce2a74c553#82d00a04211cf4e1236029aa03e6b6ce2a74c553" = "sha256-g120X88HGT8P6GNCrzpS5SutALx5H+45Sf4iSSxzctE=";
        "git+https://github.com/zed-industries/async-process.git?rev=0b6d6713570af61806e1e5cb40e0f757cb93fd9d#0b6d6713570af61806e1e5cb40e0f757cb93fd9d" = "sha256-Y37QTr6sjayv+JjGz00v0AMLQtsix1nH1lNKmky+6bU=";
        "git+https://github.com/zed-industries/async-tar?rev=bd3ad6f89df9a9da7a8535958756d6bf465936a0#bd3ad6f89df9a9da7a8535958756d6bf465936a0" = "sha256-790cqn6Iksv2xeaEWPx6u9Gl8yQxKxHP6QO7/aInTko=";
        "git+https://github.com/zed-industries/calloop#eb6b4fd17b9af5ecc226546bdd04185391b3e265" = "sha256-W6n8m+yNFivrsStQxP0jXrZFlo0srjYKqRqk9D1x2T8=";
        "git+https://github.com/zed-industries/dap-types?rev=1b461b310481d01e02b2603c16d7144b926339f8#1b461b310481d01e02b2603c16d7144b926339f8" = "sha256-H8QwXMcq5CH8qjzNw1eXQhNhPet+662kmn5LomIBzGo=";
        "git+https://github.com/zed-industries/font-kit?rev=94b0f28166665e8fd2f53ff6d268a14955c82269#94b0f28166665e8fd2f53ff6d268a14955c82269" = "sha256-KXygi0olNQi5yM8eaJVykNDtbPMDjT+cWPBF8UrtXR4=";
        "git+https://github.com/zed-industries/gh-workflow?rev=37f3c0575d379c218a9c455ee67585184e40d43f#37f3c0575d379c218a9c455ee67585184e40d43f" = "sha256-5V/PYw6vyL+retNyHbwyCoNe0PG5rjR1I4XTnkjLmwg=";
        "git+https://github.com/zed-industries/livekit-rust-sdks?rev=0a1c519cfce9b365229026b55de9b9dbdb6fed3c#0a1c519cfce9b365229026b55de9b9dbdb6fed3c" = "sha256-q6gm0Ki2zNqtgPFt4v4y1jfT0mHMUUNYtsyV1A4fscU=";
        "git+https://github.com/zed-industries/lsp-types?rev=f1783e63a7f4eb4397bf51d4148b4895a1f7ab16#f1783e63a7f4eb4397bf51d4148b4895a1f7ab16" = "sha256-d0nFsJ6qlIdZoTT+xfA++nL5vQUGwKzPXarMYEeZt0Y=";
        "git+https://github.com/zed-industries/notify?rev=0890bbb8ca40a4b5d1f67031698dd7918b37d991#0890bbb8ca40a4b5d1f67031698dd7918b37d991" = "sha256-CC4GqFonIhEDBtUIk+GSuzD8DS8LLe47qaKMvihRoeA=";
        "git+https://github.com/zed-industries/reqwest.git?rev=33bc764aa15ff7b200bf7c93bd96e24878d53e14#33bc764aa15ff7b200bf7c93bd96e24878d53e14" = "sha256-mO7cT3c5a3s3D3yv8B7E961ffuqHxnhn9+Y+CGk9Rxo=";
        "git+https://github.com/zed-industries/scap?rev=4afea48c3b002197176fb19cd0f9b180dd36eaac#4afea48c3b002197176fb19cd0f9b180dd36eaac" = "sha256-BihiQHlal/eRsktyf0GI3aSWsUCW7WcICMsC2Xvb7kw=";
        "git+https://github.com/zed-industries/trash-rs?rev=41c6c800d884a89351f3b8856d12894cccee261d#41c6c800d884a89351f3b8856d12894cccee261d" = "sha256-jLEttaISqOns3AZO6yI9Nk/szsOsU4HnP389gOsP3A8=";
        "git+https://github.com/zed-industries/tree-sitter-git-commit?rev=88309716a69dd13ab83443721ba6e0b491d37ee9#88309716a69dd13ab83443721ba6e0b491d37ee9" = "sha256-Z1BDWFXve4lRa6cTQyVHAfVo2ZFhcxKdRYpyWqbU4lY=";
        "git+https://github.com/zed-industries/tree-sitter-go-work?rev=acb0617bf7f4fda02c6217676cc64acb89536dc7#acb0617bf7f4fda02c6217676cc64acb89536dc7" = "sha256-WRMgGjOlJ+bT/YnSBeSLRTLlltA5WwTvV0Ow/949+BE=";
        "git+https://github.com/zed-industries/tree-sitter-heex?rev=1dd45142fbb05562e35b2040c6129c9bca346592#1dd45142fbb05562e35b2040c6129c9bca346592" = "sha256-SnjhL0WVsHOKuUp3dkTETnCgC/Z7WN0XmpQdJPBeBhw=";
        "git+https://github.com/zed-industries/tree-sitter-markdown?rev=b596e737286780d7bfa9fcddceaeeb754574b352#b596e737286780d7bfa9fcddceaeeb754574b352" = "sha256-ctCRhpNv5ltaAD1s3KY88TFrHvKd3yqqFXh4Nuxrfew=";
        "git+https://github.com/zed-industries/tree-sitter-typescript?rev=e2c53597d6a5d9cf7bbe8dccde576fe1e46c5899#e2c53597d6a5d9cf7bbe8dccde576fe1e46c5899" = "sha256-Hjtr5QpetJrrs1EL2QH24uc1erJLUHQGQfDUbjkmF9M=";
        "git+https://github.com/zed-industries/tree-sitter-yaml?rev=baff0b51c64ef6a1fb1f8390f3ad6015b83ec13a#baff0b51c64ef6a1fb1f8390f3ad6015b83ec13a" = "sha256-95u/bq74SiUHW8lVp3RpanmYS/lyVPW0Inn8gR7N3IQ=";
        "git+https://github.com/zed-industries/wasm_thread?rev=0cf96c7708dfb97ccf3da50347e25edcf75d6937#0cf96c7708dfb97ccf3da50347e25edcf75d6937" = "sha256-+lRLCIk0S6Y5ORYjDKsYYHia2FtoSoh+rWkQh7mnPBE=";
        "git+https://github.com/zed-industries/windows-capture.git?rev=f0d6c1b6691db75461b732f6d5ff56eed002eeb9#f0d6c1b6691db75461b732f6d5ff56eed002eeb9" = "sha256-k07Jpk4mcDo1JsZDF7AZMHRqlqFKHt60G2X3BUjMhBc=";
        "git+https://github.com/zed-industries/wprcontrol?rev=cd811f7#cd811f7d744f65291e13131b1d907fda63ed91a1" = "sha256-giOIdpZmu/o/OV1tBdGr3FdG7FkyR5CZTbv6yZCf+y0=";
        "git+https://github.com/zed-industries/xim-rs.git?rev=16f35a2c881b815a2b6cdfd6687988e84f8447d8#16f35a2c881b815a2b6cdfd6687988e84f8447d8" = "sha256-pRT4Sz1JU9ros47/7pmIW9kosWOGMOItcnNd+VrvnpE=";
        "git+https://github.com/zed-industries/yawc?rev=71a452f551cac178367eaac5d7418a09afa1f3a2#71a452f551cac178367eaac5d7418a09afa1f3a2" = "sha256-42nuLi6XLl7Mvyg5DEckT3rq4XrtW2D9rmWDJcJTMnU=";
      };
      effectiveOutputHashes = knownOutputHashes;
      missingOutputHashKeys = builtins.filter (
        key: !(builtins.hasAttr key effectiveOutputHashes)
      ) gitSourceKeys;
      extraOutputHashKeys = builtins.filter (key: !(builtins.elem key gitSourceKeys)) (
        builtins.attrNames effectiveOutputHashes
      );

      overrideVendorGitCheckout =
        crates: drv:
        if builtins.any (crate: crate.name == "webrtc-sys") crates then
          drv.overrideAttrs (old: {
            postPatch = (old.postPatch or "") + ''
              substituteInPlace webrtc-sys/build.rs --replace-fail \
                "cargo:rustc-link-lib=static=webrtc" "cargo:rustc-link-lib=dylib=webrtc"

              substituteInPlace webrtc-sys/build.rs --replace-fail \
                'add_gio_headers(&mut builder);' \
                'for lib_name in ["glib-2.0", "gio-2.0"] {
                    if let Ok(lib) = pkg_config::Config::new().cargo_metadata(false).probe(lib_name) {
                        for path in lib.include_paths {
                            builder.include(&path);
                        }
                    }
                }'
            '';
          })
        else
          drv;

      packageFor =
        package:
        package.overrideAttrs (
          old:
          let
            commonArgs = old.passthru.commonArgs // {
              cargoLock = "${zed.outPath}/Cargo.lock";
              cargoVendorDir = old.passthru.craneLib.vendorCargoDeps {
                inherit (old.passthru.commonArgs) src;
                cargoLock = "${zed.outPath}/Cargo.lock";
                outputHashes = effectiveOutputHashes;
                inherit overrideVendorGitCheckout;
              };
            };
            cargoArtifacts = old.passthru.craneLib.buildDepsOnly commonArgs;
          in
          {
            inherit cargoArtifacts;
            inherit (commonArgs) cargoVendorDir;
            passthru = old.passthru // {
              inherit commonArgs cargoArtifacts;
            };
          }
        );
    in
    assert
      (missingOutputHashKeys == [ ] && extraOutputHashKeys == [ ])
      || throw ''
        Cargo Git output hash keys do not match ${zed.outPath}/Cargo.lock:
        missing: ${builtins.toJSON missingOutputHashKeys}
        extra: ${builtins.toJSON extraOutputHashKeys}
      '';
    zed.outputs
    // {
      packages = builtins.mapAttrs (
        _: packages:
        packages
        // {
          default = packageFor packages.default;
          debug = packageFor packages.debug;
        }
      ) zed.outputs.packages;
      overlays.default = final: prev: {
        zed-editor = packageFor zed.outputs.packages.${final.system}.default;
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
