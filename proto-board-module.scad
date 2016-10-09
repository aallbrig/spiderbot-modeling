protoBoardSecureHoleInset = 2;
protoBoardSecureHoleSize = 2;
protoBoardWidth = 50.95;
protoBoardHeight = 1.15;
protoBoardLength = 70.3;

module pinHole () {
  cylinder (
    h = protoBoardHeight + 2,
    r = protoBoardSecureHoleSize / 2,
    $fn = 12
  );
}

module protoBoard () {
  color ("DarkGreen", 1) {
    difference() {
      cube([
        protoBoardWidth,
        protoBoardLength,
        protoBoardHeight
      ]);
      // top right pin
      translate([
        protoBoardWidth - protoBoardSecureHoleInset,
        protoBoardLength - protoBoardSecureHoleInset,
        -0.5
      ]) pinHole();
      // top left pin
      translate([
        0 + protoBoardSecureHoleInset,
        protoBoardLength - protoBoardSecureHoleInset,
        -0.5
      ]) pinHole();
      // bottom left pin
      translate([
        0 + protoBoardSecureHoleInset,
        0 + protoBoardSecureHoleInset,
        -0.5
      ]) pinHole();
      // bottom right pin
      translate([
        protoBoardWidth - protoBoardSecureHoleInset,
        0 + protoBoardSecureHoleInset,
        -0.5
      ]) pinHole();
    }
  }
}

/*translate([
  0,
  0,
  0
]) protoBoard();*/


