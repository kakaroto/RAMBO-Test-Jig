use <lego.scad>
use <rambo.scad>

module top_cap() {
  color("Red") union() {
    /* Area for the VRef pogo pins */
    translate([0, 2, 0]) cube([10, 30, 2]);
    /* Lego pins to fit into the holder */
    translate([0, 0, 2])  mirror([0, 0, 1]) lego_positive(10);
    translate([0, 32, 2]) mirror([0, 0, 1]) lego_positive(10);
  }
}

module top_holder() {
  color("OrangeRed") union() {
    difference () {
      /* Holder */
      cube([50, 50, 5]);
      /* Area for the VRef pogo pins */
      translate([10, 10, 3]) cube([10, 30, 5]);
      /* Hole for the cables to go through */
      translate([10, 25, 3]) cube([50, 5, 5]);
      /* VRef pogo pins */
      translate([15, 15, -1]) pogo_pin();
      translate([15, 20, -1]) pogo_pin();
      translate([15, 25, -1]) pogo_pin();
      translate([15, 30, -1]) pogo_pin();
      translate([15, 35, -1]) pogo_pin();
      /* Lego holes for the top_cap to fit into */
      translate([10, 8, 4]) lego_negative(10);
      translate([10, 40, 4]) lego_negative(10);
      /* screw hole */
      translate([12, 7, -1]) cylinder (r=1, h=10);
      translate([12, 43, -1]) cylinder (r=1, h=10);
      translate([38, 7, -1]) cylinder (r=1, h=10);
      translate([38, 43, -1]) cylinder (r=1, h=10);
    }
  }
}

top_holder();
translate([10, 8, 5]) top_cap();

