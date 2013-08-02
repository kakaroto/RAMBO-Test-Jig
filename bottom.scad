use <rambo.scad>
use <lego.scad>

module bottom_holder() {
  color("Blue") union() {
    difference() {
      /* Holder */
      cube([35, 45, 2]);
      /* Hole for the rambo board */
      translate ([2.5, 2.5, 1.01]) cube([30, 40, 1]);
    }
    /* 4 pins to hold the board from its screw holes */
    translate([4.5, 4.5, 0]) cylinder (r=0.9, h=5);
    translate([30.5, 40.5, 0]) cylinder (r=0.9, h=5);
    translate([4.5, 40.5, 0]) cylinder (r=0.9, h=5);
    translate([30.5, 4.5, 0]) cylinder (r=0.9, h=5);
  }
}

module bottom_cap() {
  color("Aqua") union() {
    difference () {
      /* Cap */
      cube([50, 50, 5]);
      /* Hole for the holder to fit in */
      translate([10, 5, -1]) cube([30, 40, 10]);
    }
    /* Connectors for the 4 screw holes */
    difference() {
      /* block that holds the board */
      translate([10, 5, 2.5]) cylinder(r=4, h=3);
      /* screw hole */
      translate([12, 7, 0]) cylinder (r=1, h=5);
    }
    difference() {
      translate([10, 45, 2.5]) cylinder(r=4, h=3);
      translate([12, 43, 0]) cylinder (r=1, h=5);
    }
    difference() {
      translate([40, 5, 2.5]) cylinder(r=4, h=3);
      translate([38, 7, 0]) cylinder (r=1, h=5);
    }
    difference() {
      translate([40, 45, 2.5]) cylinder(r=4, h=3);
      translate([38, 43, 0]) cylinder (r=1, h=5);
    }
    /* 4 pins to hold the DUT rambo from screw holes */
    translate([12, 7, 5]) cylinder (r=0.9, h=25);
    translate([12, 43, 5]) cylinder (r=0.9, h=25);
    translate([38, 7, 5]) cylinder (r=0.9, h=25);
    translate([38, 43, 5]) cylinder (r=0.9, h=25);
    /* 4 washers to hold the DUT rambo on top of the pogo pins */
    translate([12, 7, 12.5]) cylinder (r=2, h=1);
    translate([12, 43, 12.5]) cylinder (r=2, h=1);
    translate([38, 7, 12.5]) cylinder (r=2, h=1);
    translate([38, 43, 12.5]) cylinder (r=2, h=1i);
  }
}

translate([7.5, 2.5, 0]) bottom_holder();
bottom_cap();
