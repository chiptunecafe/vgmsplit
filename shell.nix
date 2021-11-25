with import <nixpkgs> { };

with pkgs;

let
  inifile = luajitPackages.buildLuarocksPackage {
    pname = "inifile";
    version = "1.0-2";

    src = fetchurl {
      url = "mirror://luarocks/inifile-1.0-2.src.rock";
      sha256 = "1hkq6wzyjixal0wn2mw05i5r1wfvynmjviyx7q91l2g8h8k48d2g";
    };
    propagatedBuildInputs = [ luajit ];
  };
  lpath = luajitPackages.buildLuarocksPackage {
    pname = "lpath";
    version = "0.3.1-1";

    src = fetchurl {
      url = "mirror://luarocks/lpath-0.3.1-1.src.rock";
      sha256 = "00r9cmbjrcrn22zys2zipknvcvi6rkzpihzwf4k0sy9msnwian3d";
    };
    propagatedBuildInputs = [ luajit ];
  };
  luaInterp = luajit.withPackages (ps: with ps; [
    argparse
    inifile
    lpath

    # for ALE
    luacheck
  ]);
in
  pkgs.mkShell {
    buildInputs = [
      luaInterp
    ];
}
