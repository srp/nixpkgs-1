args @ { fetchurl, ... }:
rec {
  baseName = ''cl-cookie'';
  version = ''20150804-git'';

  description = ''HTTP cookie manager'';

  deps = [ args."alexandria" args."cl-ppcre" args."local-time" args."proc-parse" args."quri" ];

  src = fetchurl {
    url = ''http://beta.quicklisp.org/archive/cl-cookie/2015-08-04/cl-cookie-20150804-git.tgz'';
    sha256 = ''0llh5d2p7wi5amzpckng1bzmf2bdfdwkfapcdq0znqlzd5bvbby8'';
  };

  overrides = x: {
    postInstall = ''
        echo "$CL_SOURCE_REGISTRY"
        NIX_LISP_PRELAUNCH_HOOK='nix_lisp_run_single_form "(asdf:load-system :cl-cookie)"' "$out/bin/cl-cookie-lisp-launcher.sh" ""
    '';
  };
}
