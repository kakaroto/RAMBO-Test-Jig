include <common.scad>;

board_thickness = 6.0;
hole_size = 1.65;
union () {
  RAMBo(); //Show module
  translate([(104.140000 - CLAMP_WIDTH) / 2, -(CLAMP_THICKNESS+1), 0])
    cube([CLAMP_WIDTH, CLAMP_THICKNESS+1, board_thickness]);
  translate([(104.140000 - CLAMP_WIDTH) / 2, 102.870, 0])
    cube([CLAMP_WIDTH, CLAMP_THICKNESS+1, board_thickness]);
}
