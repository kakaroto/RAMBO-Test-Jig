include <common.scad>;

board_thickness = 8.0;
board_width=104.140000;
board_height=102.870000;
hole_size = 1.75;

CORNER_HOLES=1;
MOTOR_X=0;
MOTOR_Y=0;
MOTOR_Z1=0;
MOTOR_Z2=0;
MOTOR_E0=0;
MOTOR_E1=0;
VIN=0;
MOSFET_HEAT0=0;
MOSFET_FAN0=0;
MOSFET_HEAT1=0;
MOSFET_FAN1=0;
MOSFET_HEAT_BED=0;
MOSFET_FAN2=0;
THERMISTOR0=0;
THERMISTOR1=0;
THERMISTOR2=0;
THERMISTOR3=0;
ENDSTOP_XMIN=0;
ENDSTOP_XMAX=0;
ENDSTOP_YMIN=0;
ENDSTOP_YMAX=0;
ENDSTOP_ZMIN=0;
ENDSTOP_ZMAX=0;
ICSP_M32U2=0;
ICSP_M2560=0;
I2C=0;
SERIAL=0;
SPI=0;
MOTOR_EXT1=0;
MOTOR_EXT2=0;
MOTOR_EXT3=0;
ANALOG_EXT=0;
EXT2=0;
32U2_EXT=0;
PWM_EXT=0;
USB_PINS=0;
USB_PINS_2_5_MM=0;
USB_MOUNT=0;
12V_AUX=0;
5V_AUX=0;
PS_ON=0;
POWER_SEL=0;
GND=0;
RESET=0;
EXTRA_PINS0=0;
EXTRA_PINS1=0;
EXTRA_PINS2=0;
EXTRA_PINS3=0;
VREFS=0;

M3_RADIUS_EXTRA=0.75;

module top_spacer() {
  
  difference(){
    translate([-3.810, -3.810]) cube([3.810 * 2, 3.810 * 2, TOP_SPACER_HEIGHT]);
    translate([0,0,-eta])poly_cylinder(r=M3_RADIUS+M3_RADIUS_EXTRA,h=TOP_SPACER_HEIGHT+eta*2);
  }
  //spacer(TOP_SPACER_HEIGHT, 4);
}

module RAMBo_top_plate() {
  difference() {
    union() {
      difference() {
        RAMBo(board_thickness, hole_size); // Show RAMBo board with vRefs holes
      
        // Fuse holder from 75 to 96 in X and from 92 to 100 in Y
        translate([75, 92, -eta])cube([21, 8, board_thickness+2*eta]);
        // C76 470uF capacitor
        translate([97.155, 33.337, -eta])poly_cylinder(r=7.5, h=board_thickness+2*eta);
        translate([97.155, 33.337 - 7.5, -eta])cube([7.5, 15, board_thickness+2*eta]);

        // Increase M3 hole size
        translate([3.810, 3.810, -eta]) poly_cylinder(r=M3_RADIUS+M3_RADIUS_EXTRA,h=board_thickness+eta*2);
        translate([100.330,3.810, -eta]) poly_cylinder(r=M3_RADIUS+M3_RADIUS_EXTRA,h=board_thickness+eta*2);
        translate([3.810,99.060, -eta]) poly_cylinder(r=M3_RADIUS+M3_RADIUS_EXTRA,h=board_thickness+eta*2);
        translate([100.330,99.060, -eta]) poly_cylinder(r=M3_RADIUS+M3_RADIUS_EXTRA,h=board_thickness+eta*2);
      }
      // Add spacers to the bottom
      translate([3.810, 3.810, -TOP_SPACER_HEIGHT]) top_spacer();
      translate([100.330,3.810, -TOP_SPACER_HEIGHT]) top_spacer();
      translate([3.810,99.060, -TOP_SPACER_HEIGHT]) top_spacer();
      translate([100.330,99.060, -TOP_SPACER_HEIGHT]) top_spacer();

      // Clamp extension
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

    if (CLAMP_USE_HEATSET_INSERTS) {
      /* M3 heatset holes */
      translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH/4,
                 M3_HEATSET_LENGTH-(CLAMP_THICKNESS+1)+eta, board_thickness/2])
        rotate([90, 90, 0]) 
        poly_cylinder(r=M3_HEATSET_RADIUS,h=M3_HEATSET_LENGTH+eta*2);
      translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH*3/4,
                 M3_HEATSET_LENGTH-(CLAMP_THICKNESS+1)+eta,board_thickness/2])
        rotate([90, 90, 0])
        poly_cylinder(r=M3_HEATSET_RADIUS,h=M3_HEATSET_LENGTH+eta*2);
      translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH/4,
                 board_height+(CLAMP_THICKNESS+1)+eta,board_thickness/2]) rotate([90, 90, 0])
        poly_cylinder(r=M3_HEATSET_RADIUS,h=M3_HEATSET_LENGTH+eta*2);
      translate([(board_width - CLAMP_WIDTH) / 2 + CLAMP_WIDTH*3/4,
                 board_height+(CLAMP_THICKNESS+1)+eta,board_thickness/2]) rotate([90, 90, 0])
        poly_cylinder(r=M3_HEATSET_RADIUS,h=M3_HEATSET_LENGTH+eta*2);
    } else {
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
}

translate([0, 102.87, board_thickness]) rotate([180, 0, 0]) RAMBo_top_plate();
