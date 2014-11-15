include <common.scad>

module opto_mount(extend=0) {
  overall_width=MOTOR_HOLE_DISTANCE+OPTO_MOUNT_RADIUS*2;
  union() {
    difference() {
      hull() {
        translate([OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS, 0])
          cylinder(r=OPTO_MOUNT_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS);
        translate([MOTOR_HOLE_DISTANCE + OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS, 0])
          cylinder(r=OPTO_MOUNT_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS);
        translate([OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS - MOTOR_HOLE_DISTANCE, 0])
          cylinder(r=OPTO_MOUNT_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS);
        translate([MOTOR_HOLE_DISTANCE + OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS - MOTOR_HOLE_DISTANCE, 0])
          cylinder(r=OPTO_MOUNT_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS);
        translate([overall_width/2 - OPTO_MOUNT_WIDTH/2, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
          cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_BASE_THICKNESS]);
        if (extend >= 0) {
          translate([overall_width - OPTO_MOUNT_WIDTH, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
            cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_BASE_THICKNESS]);
        }
        if (extend <= 0) {
          translate([0, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
            cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_BASE_THICKNESS]);
        }
      }
    
      translate([OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS, -eta])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS+2*eta);
      translate([MOTOR_HOLE_DISTANCE + OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS, -eta])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS+2*eta);
      translate([OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS - MOTOR_HOLE_DISTANCE, -eta])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS+2*eta);
      translate([MOTOR_HOLE_DISTANCE + OPTO_MOUNT_RADIUS, OPTO_MOUNT_RADIUS - MOTOR_HOLE_DISTANCE, -eta])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS+2*eta);
      translate([overall_width/2, -(MOTOR_HOLE_DISTANCE/2 - OPTO_MOUNT_RADIUS), -eta])
        cylinder(r=MOTOR_RADIUS, h=OPTO_MOUNT_BASE_THICKNESS+2*eta);
    }
    difference() {
      hull () {
        translate([overall_width/2 - OPTO_MOUNT_WIDTH/2, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
          cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_HEIGHT]);
        if (extend >= 0) {
          translate([overall_width - OPTO_MOUNT_WIDTH, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
            cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_HEIGHT]);
        } else if (extend <= 0) {
          translate([0, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS, 0])
            cube([OPTO_MOUNT_WIDTH, OPTO_MOUNT_THICKNESS, OPTO_MOUNT_HEIGHT]);
        }
      }
      translate([overall_width/2, OPTO_MOUNT_BASE_HEIGHT+eta, 7.5]) rotate([90, 0, 0])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_THICKNESS+2*eta);
      translate([overall_width/2, OPTO_MOUNT_BASE_HEIGHT+eta, 26.5]) rotate([90, 0, 0])
        cylinder(r=M3_RADIUS, h=OPTO_MOUNT_THICKNESS+2*eta);
        
      if (OPTO_MOUNT_USE_HEATSET_INSERTS) {
        // Heat-set inserts
        translate([overall_width/2, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS/2+eta, 7.5]) rotate([90, 0, 0])
          cylinder(r=M3_HEATSET_RADIUS, h=M3_HEATSET_LENGTH+2*eta);
        translate([overall_width/2, OPTO_MOUNT_BASE_HEIGHT-OPTO_MOUNT_THICKNESS/2+eta, 26.5]) rotate([90, 0, 0])
          cylinder(r=M3_HEATSET_RADIUS, h=M3_HEATSET_LENGTH+2*eta);
      }
    }
  }
}

opto_mount(-1);
