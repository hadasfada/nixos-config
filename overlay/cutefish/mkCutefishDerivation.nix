{ lib, mkDerivation, fetchFromGitHub, cmake, wrapQtAppsHook }:

{ pname ? "cutefish-${repo}"
, repo
, version
, rev ? version
, sha256
, ...
} @ args:

let
  inherit (builtins) filter getAttr head isList;
  inherit (lib) attrNames concatLists recursiveUpdate zipAttrsWithNames;

  filterAttrNames = f: attrs:
    filter (n: f (getAttr n attrs)) (attrNames attrs);

  concatAttrLists = attrsets:
    zipAttrsWithNames (filterAttrNames isList (head attrsets)) (_: concatLists) attrsets;

  template = rec {
    inherit pname version;

    nativeBuildInputs = [ cmake wrapQtAppsHook ];

    src = fetchFromGitHub {
      owner = "cutefishos";
      inherit repo rev sha256;
    };

    enableParallelBuilding = true;

    pos = builtins.unsafeGetAttrPos "pname" args;

    meta = with lib; {
      homepage = "https://cutefishos.com/";
      license = licenses.gpl3Plus;
      platforms = platforms.linux;
    };
  };

  publicArgs = removeAttrs args [ "repo" "sha256" ];
in

mkDerivation (recursiveUpdate template publicArgs // concatAttrLists [ template args ])
