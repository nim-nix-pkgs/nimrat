{
  description = ''Rational arithmetic module for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimrat-master.flake = false;
  inputs.src-nimrat-master.owner = "apense";
  inputs.src-nimrat-master.ref   = "master";
  inputs.src-nimrat-master.repo  = "nimrat";
  inputs.src-nimrat-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimrat-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimrat-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}