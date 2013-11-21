include <common.scad>;

difference(){
  cube([FOOT_WIDTH, FOOT_WIDTH, FOOT_HEIGHT]);
  translate([FOOT_WIDTH/2, FOOT_WIDTH/2,-eta])
    poly_cylinder(r=MOUNT_SCREW_RADIUS,h=FOOT_HEIGHT+eta*2);
  translate([FOOT_WIDTH/2, FOOT_WIDTH/2, FOOT_HEIGHT-FOOT_INSET_HEIGHT-eta])
    poly_cylinder(r=MOUNT_SCREW_RADIUS*2,h=FOOT_HEIGHT+eta*2);
}
