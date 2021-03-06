args @ { fetchurl, ... }:
rec {
  baseName = ''md5'';
  version = ''20150804-git'';

  description = ''The MD5 Message-Digest Algorithm RFC 1321'';

  deps = [ ];

  src = fetchurl {
    url = ''http://beta.quicklisp.org/archive/md5/2015-08-04/md5-20150804-git.tgz'';
    sha256 = ''1sf79pjip19sx7zmznz1wm4563qc208lq49m0jnhxbv09wmm4vc5'';
  };

  overrides = x: {
    postInstall = ''
        echo "$CL_SOURCE_REGISTRY"
        NIX_LISP_PRELAUNCH_HOOK='nix_lisp_run_single_form "(asdf:load-system :md5)"' "$out/bin/md5-lisp-launcher.sh" ""
    '';
  };
}
