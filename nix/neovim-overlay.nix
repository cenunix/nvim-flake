# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # Make sure we use the pinned nixpkgs instance for wrapNeovimUnstable,
  # otherwise it could have an incompatible signature when applying this overlay.
  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    # plugins from nixpkgs go in here.
    # https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=vimPlugins
    nvim-autopairs
    nvim-lspconfig
    vim-qml
    nvim-cmp
    luasnip
    bufferline-nvim
    copilot-vim
    cmp_luasnip
    friendly-snippets
    cmp-nvim-lsp
    null-ls-nvim
    neo-tree-nvim
    nvim-web-devicons
    lualine-nvim
    nvim-navic
    harpoon
    comment-nvim
    which-key-nvim
    telescope-nvim
    toggleterm-nvim
    gitsigns-nvim
    noice-nvim
    nui-nvim
    catppuccin-nvim
    (nvim-treesitter.withPlugins
      (p: [ p.c p.cpp p.nix p.lua p.go p.python p.qmljs p.qmldir ]))
  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    deadnix
    statix
    nixd
    nil
    gopls
    clang-tools
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    lua-language-server
    stylua
    prettierd
    eslint_d
    nixpkgs-fmt
    nixfmt
    nodePackages.pyright
    qt6.qtdeclarative
    black
    isort
    go
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json { plugins = all-plugins; };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
