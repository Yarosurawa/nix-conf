{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    carlito
    dejavu_fonts
    ipafont
    kochi-substitute
    source-code-pro
    ttf_bitstream_vera
    ];

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };
}
