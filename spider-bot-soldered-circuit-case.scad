include <proto-board-module.scad>;
include <case-module.scad>;

translate([
  0,
  0,
  0
]) case();

/*translate([
  (caseWidth - protoBoardWidth) / 2,
  (caseLength - protoBoardLength) / 2,
  caseSecureHoleConnectionBaseHeight + caseHeight
]) protoBoard();*/