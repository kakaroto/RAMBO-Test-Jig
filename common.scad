include <Magpie/magpie.scad>;
include <RAMBo.scad>;
include <configuration.scad>;

module spacer(height, radius=5)
{
  difference(){
    cylinder(r=radius, h=height);
    translate([0,0,-eta])poly_cylinder(r=M3_RADIUS,h=height+eta*2);
  }
}

module hole(r) {
  translate ([-r/2, -r/2, 0]) square(r, r);
}
