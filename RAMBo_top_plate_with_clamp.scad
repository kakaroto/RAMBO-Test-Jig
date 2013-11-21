include <common.scad>
include <RAMBo_top_plate.scad>

board_thickness = 9.0;
board_width=104.140000;
board_height=102.870000;
mode="both"; // board, clamp, both, assembled

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

module board() {
  difference() {
    union() {
      RAMBo_top_plate();
      translate([(board_width - CLAMP_WIDTH) / 2, -(CLAMP_THICKNESS+1)+eta, 0])
	cube([CLAMP_WIDTH, CLAMP_THICKNESS+1, board_thickness]);
      translate([(board_width - CLAMP_WIDTH) / 2, board_height-eta, 0])
	cube([CLAMP_WIDTH, CLAMP_THICKNESS+1, board_thickness]);
    }

    /* M3 holes*/
    translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH/4,
	       M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1)+eta, board_thickness/2])
      rotate([90, 90, 0]) 
      poly_cylinder(r=M3_RADIUS,h=M3_LENGTH-CLAMP_THICKNESS+eta*2);
    translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH*3/4,
	       M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1)+eta,board_thickness/2])
      rotate([90, 90, 0])
      poly_cylinder(r=M3_RADIUS,h=M3_LENGTH-CLAMP_THICKNESS+eta*2);
    translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH/4,
	       board_height+(CLAMP_THICKNESS+1)+eta,board_thickness/2]) rotate([90, 90, 0])
      poly_cylinder(r=M3_RADIUS,h=M3_LENGTH-CLAMP_THICKNESS+eta*2);
    translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH*3/4,
	       board_height+(CLAMP_THICKNESS+1)+eta,board_thickness/2]) rotate([90, 90, 0])
      poly_cylinder(r=M3_RADIUS,h=M3_LENGTH-CLAMP_THICKNESS+eta*2);

    /* Nut holes */
    translate([(board_width - CLAMP_WIDTH - M3_NUT_WIDTH) / 2 + CLAMP_WIDTH/4,
	       M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1)-M3_NUT_DEPTH-1,-eta])
      cube([M3_NUT_WIDTH, M3_NUT_DEPTH, board_thickness+eta*2]);
    translate([(board_width - CLAMP_WIDTH - M3_NUT_WIDTH) / 2 + CLAMP_WIDTH*3/4,
	       M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1)-M3_NUT_DEPTH-1,-eta])
      cube([M3_NUT_WIDTH, M3_NUT_DEPTH, board_thickness+eta*2]);
    translate([(board_width - CLAMP_WIDTH - M3_NUT_WIDTH) / 2 + CLAMP_WIDTH/4,
	       board_height-(M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1))+1,-eta])
      cube([M3_NUT_WIDTH, M3_NUT_DEPTH, board_thickness+eta*2]);
    translate([(board_width - CLAMP_WIDTH - M3_NUT_WIDTH) / 2 + CLAMP_WIDTH*3/4,
	       board_height-(M3_LENGTH-CLAMP_THICKNESS-(CLAMP_THICKNESS+1))+1,-eta])
      cube([M3_NUT_WIDTH, M3_NUT_DEPTH, board_thickness+eta*2]);
  }
}

if (mode == "assembled") {
  union() {
    board();
    translate ([-CLAMP_THICKNESS, 20, -CLAMP_HEIGHT+board_thickness]) clamp();
    translate ([board_width + CLAMP_THICKNESS, 20, -CLAMP_HEIGHT+board_thickness]) mirror([1, 0, 0]) clamp();
  }
 } else if (mode == "board") {
  translate([0, board_height, board_thickness]) rotate([180, 0, 0]) board();
 } else if (mode == "clamp") {
  rotate([0, 90, 0]) mirror([1, 0, 0]) clamp();
 } else if (mode == "both") {
  translate([0, board_height, board_thickness]) rotate([180, 0, 0]) board(); 
  
  translate([10+CLAMP_HEIGHT+CLAMP_HOOK_HEIGHT, 120, 0]) rotate([0, 90, 0]) mirror([1, 0, 0]) clamp();
  translate([0, 120, 0]) rotate([0, 90, 0]) mirror([1, 0, 0]) clamp();
 }

