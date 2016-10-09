include <proto-board-module.scad>;

caseSecureHoleConnectionPinWidth = 1.25;
caseSecureHoleConnectionPinHeight = 6;
caseSecureHoleConnectionBaseWidth = caseSecureHoleConnectionPinWidth * 2;
caseSecureHoleConnectionBaseHeight = 6;
caseWidth = 68;
caseHeight = 3;
caseLength = 89;
caseWallHeight = 18;
caseWallWidth = 3;

module pinHolder () {
  baseHeight = protoBoardHeight + 1;
  cylinder (
    h = caseSecureHoleConnectionBaseHeight,
    r = caseSecureHoleConnectionBaseWidth / 2,
    $fn = 12
  );
  translate([0, 0, baseHeight])
    cylinder (
      h = caseSecureHoleConnectionPinHeight + 1,
      r = caseSecureHoleConnectionPinWidth / 2,
    $fn = 12
    );
}

module case (color = "LightSeaGreen") {
  color (color) {
    // Base
    cube([caseWidth, caseLength, caseHeight]);
    // Walls
    rotate([0, 0, 0]) cube([caseWallWidth, caseLength, caseWallHeight]);
    translate([caseWidth, caseLength, 0])
      rotate([0, 0, 90]) 
        cube([caseWallWidth, caseWidth, caseWallHeight]);
    translate([caseWidth, caseLength, 0]) 
      rotate([0, 0, 180]) 
        cube([caseWallWidth, caseLength, caseWallHeight]);
    translate([0, 0, 0])
      rotate([0, 0, 270])
        cube([caseWallWidth, caseWidth, caseWallHeight]);
    // Connection Pins Base
    // Top right pin holder
    translate([
        caseWidth - (caseSecureHoleConnectionBaseWidth / 2) - ((caseWidth - protoBoardWidth) / 2) - (protoBoardSecureHoleInset / 3),
        caseLength - (caseSecureHoleConnectionBaseWidth / 2) - ((caseLength - protoBoardLength) / 2) - (protoBoardSecureHoleInset / 3),
        caseHeight
    ]) pinHolder();
    // Top left pin holder
    translate([
        0 + (caseSecureHoleConnectionBaseWidth / 2) + ((caseWidth - protoBoardWidth) / 2) + (protoBoardSecureHoleInset / 3),
        caseLength - (caseSecureHoleConnectionBaseWidth / 2) - ((caseLength - protoBoardLength) / 2) - (protoBoardSecureHoleInset / 3),
        caseHeight
    ]) pinHolder();
    // Bottom left pin holder
    translate([
        0 + (caseSecureHoleConnectionBaseWidth / 2) + ((caseWidth - protoBoardWidth) / 2) + (protoBoardSecureHoleInset / 3),
        0 + (caseSecureHoleConnectionBaseWidth / 2) + ((caseLength - protoBoardLength) / 2) + (protoBoardSecureHoleInset / 3),
        caseHeight
    ]) pinHolder();
    // Bottom right pin holder
    translate([
        caseWidth - (caseSecureHoleConnectionBaseWidth / 2)  - ((caseWidth - protoBoardWidth) / 2) - (protoBoardSecureHoleInset / 3),
        0 + (caseSecureHoleConnectionBaseWidth / 2) + ((caseLength - protoBoardLength) / 2) + (protoBoardSecureHoleInset / 3),
        caseHeight
    ]) pinHolder();
  }
}
