include <Magpie/magpie.scad>;

module hole(type, r) {
  if (type == "square") {
    translate ([-r/2, -r/2, 0]) square(r, r);
  } else {
    poly_circle(r);
  }
}

module 2x6_holes(x, r, type = "poly_circle") {
  translate([x, 3])hole(type, r); //package hole
  translate([x, 3 + 2.54])hole(type, r); //package hole
  translate([x, 3 + 2.54 + 2.54])hole(type, r); //package hole
  translate([x + 2.54, 3])hole(type, r); //package hole
  translate([x + 2.54, 3 + 2.54])hole(type, r); //package hole
  translate([x + 2.54, 3 + 2.54 + 2.54])hole(type, r); //package hole

  translate([x + 1.2, 13])hole(type, r); //package hole
  
}

module calibration_board(){
  board_thickness = 2.00000;
  board_w = 75;
  board_h = 20;
  union(){
    color("red")linear_extrude(height=board_thickness,convexity=10) difference(){
      square([board_w, board_h]);
      // Find M3 hole size where screw fits correctly
      translate([3.810, 3.810])poly_circle(r=1.50);
      translate([3.810, board_h / 2])poly_circle(r=1.55);
      translate([3.810, board_h - 3.810])poly_circle(r=1.60);

      translate([board_w - 3.810, 3.810])poly_circle(r=1.65);
      translate([board_w - 3.810, board_h / 2])poly_circle(r=1.70);
      translate([board_w - 3.810, board_h - 3.810])poly_circle(r=1.75);

      // Find square hole that best fits pogo pin and receptacle
      2x6_holes(8, 1.55, "square");
      2x6_holes(16, 1.65, "square");
      2x6_holes(24, 1.70, "square");
      2x6_holes(31, 1.75, "square");

      // Find poly_circle that best fits pogo pin and receptacle
      2x6_holes(39, 0.6);
      2x6_holes(46, 0.65);
      2x6_holes(54, 0.70);
      2x6_holes(61, 0.75);

      // Decide which to chose and which size
    }
  }
}

calibration_board();
