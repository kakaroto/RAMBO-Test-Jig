module pogo_pin () {
  color("Yellow") union() {
    cylinder (r=0.5, h=10);
    translate ([0, 0, 10]) cylinder (r=0.25, h=5);
  }
}

module rambo_board() {
  color("Green") difference() {
    cube([30, 40, 1]);
    translate([2, 2, -1]) cylinder (r=1, h=5);
    translate([28, 38, -1]) cylinder (r=1, h=5);
    translate([2, 38, -1]) cylinder (r=1, h=5);
    translate([28, 2, -1]) cylinder (r=1, h=5);
  }
}

module rambo_connector() {
  color("Gray") cube([3, 5, 5]);
}

module rambo_connectors() {
  /* motors */
  translate([2, 2, 0]) rambo_connector();
  translate([2, 10, 0]) rambo_connector();
  translate([2, 18, 0]) rambo_connector();
  translate([2, 26, 0]) rambo_connector();
  translate([2, 34, 0]) rambo_connector();
  /* endstops */
  translate([10, 29, 0]) rambo_connector();
  translate([10, 35, 0]) rambo_connector();
  translate([14, 29, 0]) rambo_connector();
  translate([14, 35, 0]) rambo_connector();
  /* Thermistors */
  translate([12, 10, 0]) rambo_connector();
  translate([15, 10, 0]) rambo_connector();
  /* USB */
  translate([20, 37, 0]) rambo_connector();
  /* Mosfets */
  translate([25, 20, 0]) rambo_connector();
  translate([25, 25, 0]) rambo_connector();
  translate([25, 30, 0]) rambo_connector();
  translate([25, 33, 0]) rambo_connector();
  /* Power */
  translate([25, 2, 0]) rotate([0, 0, 90]) rambo_connector();
  translate([30, 2, 0]) rotate([0, 0, 90]) rambo_connector();
}

module rambo_pins() {
  /* motors */
  translate([5, 5, 0]) pogo_pin();
  translate([5, 10, 0]) pogo_pin();
  translate([5, 15, 0]) pogo_pin();
  translate([5, 20, 0]) pogo_pin();
  translate([5, 25, 0]) pogo_pin();
  translate([5, 30, 0]) pogo_pin();
  translate([5, 35, 0]) pogo_pin();
  /* endstops */
  translate([12, 30, 0]) pogo_pin();
  translate([12, 32.5, 0]) pogo_pin();
  translate([12, 35, 0]) pogo_pin();
  translate([15, 30, 0]) pogo_pin();
  translate([15, 32.5, 0]) pogo_pin();
  translate([15, 35, 0]) pogo_pin();
  /* ISP */
  translate([20, 12.5, 0]) pogo_pin();
  translate([20, 15, 0]) pogo_pin();
  translate([20, 22.5, 0]) pogo_pin();
  translate([20, 25, 0]) pogo_pin();
  /* Power */
  translate([25, 5, 0]) pogo_pin();
  translate([20, 5, 0]) pogo_pin();
  /* Mosfets */
  translate([25, 20, 0]) pogo_pin();
  translate([25, 25, 0]) pogo_pin();
  translate([25, 35, 0]) pogo_pin();
}

module rambo(connectors=1, holes=0, pins=0) {
  if (connectors) {
    union() {
      rambo_board();
      rambo_connectors();
    }
  } else if (holes) {
    difference() {
      rambo_board();
      translate([0, 0, -1]) rambo_pins();
    }
  } else if (pins) {
    union() {
      rambo_board();
      rambo_pins();
    }
  } else {
    rambo_board();
  }
}

rambo(1, 0, 0);
