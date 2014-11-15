include <common.scad>

// Needs to be the same as RAMBo_top_board.scad
board_thickness = 8.0;


module clamp() {
  difference() {
    union() {
      // Clamp
      cube([CLAMP_THICKNESS, CLAMP_WIDTH, CLAMP_HEIGHT+CLAMP_HOOK_HEIGHT]);
      // Hook cylinder
      hull() {
	translate([(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   (CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2, 0])
	  cylinder(h=CLAMP_HOOK_HEIGHT-CLAMP_HOOK_BORDER_HEIGHT,
		   r1=0, r2=(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2);
	translate([(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   CLAMP_WIDTH - (CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2, 0])
	  cylinder(h=CLAMP_HOOK_HEIGHT-CLAMP_HOOK_BORDER_HEIGHT,
		   r1=0, r2=(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2);
      }
      // Hook border
      hull() {
	translate([(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   (CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   CLAMP_HOOK_HEIGHT-CLAMP_HOOK_BORDER_HEIGHT])
	  cylinder(h=CLAMP_HOOK_BORDER_HEIGHT, r=(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2);
	translate([(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   CLAMP_WIDTH - (CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2,
		   CLAMP_HOOK_HEIGHT-CLAMP_HOOK_BORDER_HEIGHT])
	  cylinder(h=CLAMP_HOOK_BORDER_HEIGHT, r=(CLAMP_THICKNESS + CLAMP_HOOK_WIDTH) / 2);
      }
    }
    
    // Screw holes
    translate([-eta,CLAMP_WIDTH/4,CLAMP_HEIGHT+CLAMP_HOOK_HEIGHT-board_thickness/2])
      rotate([0, 90, 0])
      poly_cylinder(r=M3_RADIUS,h=CLAMP_THICKNESS+eta*2);
    translate([-eta,CLAMP_WIDTH*3/4,CLAMP_HEIGHT+CLAMP_HOOK_HEIGHT-board_thickness/2])
      rotate([0, 90, 0])
      poly_cylinder(r=M3_RADIUS,h=CLAMP_THICKNESS+eta*2);
  }
}


rotate([0, 90, 0]) mirror([1, 0, 0]) clamp();