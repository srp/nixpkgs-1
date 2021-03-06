args @ { fetchurl, ... }:
rec {
  baseName = ''circular-streams'';
  version = ''20161204-git'';

  description = ''Circularly readable streams for Common Lisp'';

  deps = [ args."fast-io" args."trivial-gray-streams" ];

  src = fetchurl {
    url = ''http://beta.quicklisp.org/archive/circular-streams/2016-12-04/circular-streams-20161204-git.tgz'';
    sha256 = ''1i29b9sciqs5x59hlkdj2r4siyqgrwj5hb4lnc80jgfqvzbq4128'';
  };

  overrides = x: {
    postInstall = ''
        echo "$CL_SOURCE_REGISTRY"
        NIX_LISP_PRELAUNCH_HOOK='nix_lisp_run_single_form "(asdf:load-system :circular-streams)"' "$out/bin/circular-streams-lisp-launcher.sh" ""
    '';
  };
}
