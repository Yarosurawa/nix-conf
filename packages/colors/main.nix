{
	clr1 = {
		primary = "#ef1068";
		secondary = "#b80c4a";
	};

	clr2.primary = "#26d9be";

	bg =  {
		primary = "#160710";
		secondary = "#260716";
		tertiary = "#200713";
	};

	fg = {
		primary = "#fcffdf";
	};

	hypr_rgba = color: alpha:
    "rgba(${builtins.substring 1 6 color}${alpha})";

	no_hash = color:
		"${builtins.substring 1 6 color}";
}
