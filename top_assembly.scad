use <top.scad>
use <rambo.scad>

module top() {
  if ($t < 0.5) {
    top_holder();
    assign (animation = ($t/0.5)) {
      translate([15, 15, animation * 5]) mirror([0, 0, 1]) pogo_pin();
      translate([15, 20, animation * 5]) mirror([0, 0, 1]) pogo_pin();
      translate([15, 25, animation * 5]) mirror([0, 0, 1]) pogo_pin();
      translate([15, 30, animation * 5]) mirror([0, 0, 1]) pogo_pin();
      translate([15, 35, animation * 5]) mirror([0, 0, 1]) pogo_pin();
    }
  } else if ($t < 0.75) {
    top_holder();
    translate([15, 15, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 20, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 25, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 30, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 35, 5]) mirror([0, 0, 1]) pogo_pin();
    assign (animation = (($t-0.5)/0.25))
      translate([10, 8, 15 - animation * 10]) top_cap();
  } else {
    top_holder();
    translate([15, 15, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 20, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 25, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 30, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([15, 35, 5]) mirror([0, 0, 1]) pogo_pin();
    translate([10, 8, 5]) top_cap();
  }
}

top();
