{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    carlito
    dejavu_fonts
    ipafont
		nerd-fonts.lilex
		nerd-fonts.hack
		nerd-fonts.agave
		nerd-fonts.arimo
    kochi-substitute
    source-code-pro
    ttf_bitstream_vera
    iosevka
		terminus_font
		terminus_font_ttf
		nerd-fonts.iosevka-term
		zpix-pixel-font
	];

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
  };
}
