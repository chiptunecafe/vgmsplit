with import /nixpkgs {};

let
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
      (vim_configurable.customize {
        name = "vim";
        vimrcConfig = {
          customRC = ''
            set nocompatible
            set history=1024
            if has ("syntax")
              syntax on
            endif
            set ruler
            set mouse-=a
            set tabstop=2
            set shiftwidth=2
            set softtabstop=2
            set expandtab
            set number
            set laststatus=2
            set noshowmode
          '';
          packages.myVimPackages = with pkgs.vimPlugins; {
            start = [
              vim-better-whitespace
              vim-indent-guides
              vim-nix
              youcompleteme
              ale
              editorconfig-vim
              file-line
              Recover-vim
              lightline-vim
              lightline-ale
            ];
          };
        };
      })
    ];
}
