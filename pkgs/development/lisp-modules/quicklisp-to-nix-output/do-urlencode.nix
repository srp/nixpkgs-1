args @ { fetchurl, ... }:
rec {
  baseName = ''do-urlencode'';
  version = ''20130720-git'';

  description = ''Percent Encoding (aka URL Encoding) library'';

  deps = [ args."babel" args."babel-streams" ];

  src = fetchurl {
    url = ''http://beta.quicklisp.org/archive/do-urlencode/2013-07-20/do-urlencode-20130720-git.tgz'';
    sha256 = ''19l4rwqc52w7nrpy994b3n2dcv8pjgc530yn2xmgqlqabpxpz3xa'';
  };

  overrides = x: {
    postInstall = ''
        echo "$CL_SOURCE_REGISTRY"
        NIX_LISP_PRELAUNCH_HOOK='nix_lisp_run_single_form "(asdf:load-system :do-urlencode)"' "$out/bin/do-urlencode-lisp-launcher.sh" ""
    '';
  };
}
