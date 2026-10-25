{ pkgs, ... }:

let
  touchScript = pkgs.writeShellScriptBin "touch_script" ''
    #!/usr/bin/env bash
		set -euo pipefail
		#######################################################
		#                                                     #
		# Executable : touch_script                           #
		# Description: Creates a bash script                  #
		#                                                     #
		#######################################################

		if [ $# -ne 1 ]; then 
			echo "Usage: $0 <script_name>" >&2 
			exit 1
		fi
	
		s_name="$1"
		if [ -e "$s_name" ];then
			echo "$s_name already exists."
			exit 2
		fi

		echo "#!/usr/bin/env bash" > "$s_name"
		chmod +x "$s_name"
  '';
in
{
  environment.systemPackages = [
    touchScript
  ];
}
