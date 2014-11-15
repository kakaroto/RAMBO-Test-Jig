include <Magpie/magpie.scad>;
include <MCAD/2Dshapes.scad>;
include <common.scad>;

module flag(height,shaft,radius){
	difference(){
		union(){
			cylinder(r=shaft/2+M3_NUT_DEPTH*2, h=M3_NUT_WIDTH*2);
			linear_extrude(height=2)pieSlice(radius, 0, 36);
			linear_extrude(height=2)pieSlice(radius, 36+72, 36+72+108);
		}
		translate([0,0,-eta])poly_cylinder(r=shaft/2, h=height*2+eta*2);
		translate([0,0,M3_NUT_WIDTH])rotate([0,90,0])poly_cylinder(r=M3_RADIUS,h=10);
		translate([shaft/2 + M3_NUT_DEPTH + M3_NUT_DEPTH/2,0,M3_NUT_WIDTH])rotate([0,90,0])poly_cylinder(r=M3_HEAD_RADIUS,h=10);
		translate([shaft/2,-M3_NUT_WIDTH/2,M3_NUT_WIDTH])cube([M3_NUT_DEPTH,M3_NUT_WIDTH,M3_NUT_WIDTH+eta]);
		translate([shaft/2,0,M3_NUT_WIDTH])rotate([0,90,0])
                  cylinder(r=M3_NUT_WIDTH/cos(30)/2,h=M3_NUT_DEPTH, $fn=6);

	}
}

flag(10,5.25,20);
