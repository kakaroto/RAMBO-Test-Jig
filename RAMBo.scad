include <common.scad>;

board_thickness=1.6;
hole_size=1.55;

CORNER_HOLES=1;
MOTOR_X=1;
MOTOR_Y=1;
MOTOR_Z1=1;
MOTOR_Z2=1;
MOTOR_E0=1;
MOTOR_E1=1;
VIN=1;
MOSFET_HEAT0=1;
MOSFET_FAN0=1;
MOSFET_HEAT1=1;
MOSFET_FAN1=1;
MOSFET_HEAT_BED=1;
MOSFET_FAN2=1;
THERMISTOR0=1;
THERMISTOR1=1;
THERMISTOR2=1;
THERMISTOR3=1;
ENDSTOP_POWER=1;
ENDSTOP_XMIN=1;
ENDSTOP_XMAX=1;
ENDSTOP_YMIN=1;
ENDSTOP_YMAX=1;
ENDSTOP_ZMIN=1;
ENDSTOP_ZMAX=1;
ICSP_M32U2=1;
ICSP_M2560=1;
I2C=1;
SERIAL=1;
SPI=1;
MOTOR_EXT1=1;
MOTOR_EXT2=1;
MOTOR_EXT3=1;
ANALOG_EXT=1;
EXT2=1;
32U2_EXT=1;
PWM_EXT=1;
USB_PINS=1;
USB_MOUNT=1;
12V_AUX=1;
5V_AUX=1;
PS_ON=1;
POWER_SEL=1;
GND=1;
RESET=1;
EXTRA_PINS0=1;
EXTRA_PINS1=1;
EXTRA_PINS2=1;
EXTRA_PINS3=1;
VREFS=0;

module RAMBo1_1(){
	board_size = [104.140000,102.870000];
	union(){
		color("red") linear_extrude(height=board_thickness,center=false, convexity=10) difference(){
			square(board_size); //Board
			if (CORNER_HOLES) {
			  translate([3.810,3.810])poly_circle(r=M3_RADIUS); //3,0-PAD-SQUARE B3,0
			  translate([100.330,3.810])poly_circle(r=M3_RADIUS); //3,0-PAD-SQUARE B3,0
			  translate([3.810,99.060])poly_circle(r=M3_RADIUS); //3,0-PAD-SQUARE B3,0
			  translate([100.330,99.060])poly_circle(r=M3_RADIUS); //3,0-PAD-SQUARE B3,0
			}
			if (POWER_SEL) {
			  translate([13.970,65.881])hole(r=hole_size); //1X03 1
			  translate([13.970,68.421])hole(r=hole_size); //1X03 2
			  translate([13.970,70.961])hole(r=hole_size); //1X03 3
			}
			if (RESET) {
			  translate([2.184,81.890])hole(r=hole_size); //B3F-31XX 1
			  translate([2.184,77.368])hole(r=hole_size); //B3F-31XX 2
			  translate([4.674,83.134])hole(r=hole_size); //B3F-31XX 3
			  translate([4.674,76.124])hole(r=hole_size); //B3F-31XX 4
			}
			if (GND) {
			  translate([101.990,93.120])hole(r=hole_size); //1X01 1
			}
			if (5V_AUX) {
			  translate([3.016,91.916])hole(r=hole_size); //70543-02 1
			  translate([5.556,91.916])hole(r=hole_size); //70543-02 2
			}
			if (USB_PINS) {
			  translate([11.060,57.170])hole(r=hole_size); //PN61729 1
			  translate([11.060,59.670])hole(r=hole_size); //PN61729 2
			  translate([9.060,59.670])hole(r=hole_size); //PN61729 3
			  translate([9.060,57.170])hole(r=hole_size); //PN61729 4
			}
			if (USB_MOUNT) {
			  translate([6.350,64.420])hole(r=hole_size); //PN61729 P$1
			  translate([6.350,52.420])hole(r=hole_size); //PN61729 P$2
			}
			if (MOTOR_Y) {
			  translate([34.223,4.648])hole(r=hole_size); //4POL254 1
			  translate([31.683,4.648])hole(r=hole_size); //4POL254 2
			  translate([29.143,4.648])hole(r=hole_size); //4POL254 3
			  translate([26.603,4.648])hole(r=hole_size); //4POL254 4
			}
			if (PS_ON) {
			  translate([77.860,60.850])hole(r=hole_size); //70543-02 1
			  translate([77.860,58.310])hole(r=hole_size); //70543-02 2
			}
			if (MOTOR_E0) {
			  translate([77.403,4.648])hole(r=hole_size); //4POL254 1
			  translate([74.862,4.648])hole(r=hole_size); //4POL254 2
			  translate([72.323,4.648])hole(r=hole_size); //4POL254 3
			  translate([69.782,4.648])hole(r=hole_size); //4POL254 4
			}
			if (MOTOR_E1) {
			  translate([92.642,4.648])hole(r=hole_size); //4POL254 1
			  translate([90.103,4.648])hole(r=hole_size); //4POL254 2
			  translate([87.562,4.648])hole(r=hole_size); //4POL254 3
			  translate([85.023,4.648])hole(r=hole_size); //4POL254 4
			}
			if (MOTOR_X) {
			  translate([19.050,4.648])hole(r=hole_size); //4POL254 1
			  translate([16.510,4.648])hole(r=hole_size); //4POL254 2
			  translate([13.970,4.648])hole(r=hole_size); //4POL254 3
			  translate([11.430,4.648])hole(r=hole_size); //4POL254 4
			}
			if (MOSFET_FAN2) {
			  translate([41.720,81.788])hole(r=hole_size); //70543-02 1
			  translate([44.260,81.788])hole(r=hole_size); //70543-02 2
			}
			if (I2C) {
			  translate([34.390,35.858])hole(r=hole_size); //70543-04 1
			  translate([34.390,38.398])hole(r=hole_size); //70543-04 2
			  translate([34.390,40.938])hole(r=hole_size); //70543-04 3
			  translate([34.390,43.477])hole(r=hole_size); //70543-04 4
			}
			if (MOSFET_HEAT0) {
			  translate([11.430,93.980])hole(r=hole_size); //MSTBV10 1
			  translate([16.510,93.980])hole(r=hole_size); //MSTBV10 2
			}
			if (MOSFET_FAN0) {
			  translate([21.590,93.980])hole(r=hole_size); //MSTBV10 3
			  translate([26.670,93.980])hole(r=hole_size); //MSTBV10 4
			}
			if (MOSFET_HEAT1) {
			  translate([31.750,93.980])hole(r=hole_size); //MSTBV10 5
			  translate([36.830,93.980])hole(r=hole_size); //MSTBV10 6
			}			
			if (MOSFET_FAN1) {
			  translate([41.910,93.980])hole(r=hole_size); //MSTBV10 7
			  translate([46.990,93.980])hole(r=hole_size); //MSTBV10 8
			}
			if (MOSFET_HEAT_BED) {
			  translate([52.070,93.980])hole(r=hole_size); //MSTBV10 9
			  translate([57.150,93.980])hole(r=hole_size); //MSTBV10 10
			}
			if (SPI) {
			  translate([47.943,42.545])hole(r=hole_size); //2X4 1
			  translate([47.943,45.085])hole(r=hole_size); //2X4 2
			  translate([50.483,42.545])hole(r=hole_size); //2X4 3
			  translate([50.483,45.085])hole(r=hole_size); //2X4 4
			  translate([53.023,42.545])hole(r=hole_size); //2X4 5
			  translate([53.023,45.085])hole(r=hole_size); //2X4 6
			  translate([55.562,42.545])hole(r=hole_size); //2X4 7
			  translate([55.562,45.085])hole(r=hole_size); //2X4 8
			}
			if (EXT2) {
			  translate([67.201,64.953])hole(r=hole_size); //2X10 1
			  translate([67.201,67.493])hole(r=hole_size); //2X10 2
			  translate([69.740,64.953])hole(r=hole_size); //2X10 3
			  translate([69.740,67.493])hole(r=hole_size); //2X10 4
			  translate([72.281,64.953])hole(r=hole_size); //2X10 5
			  translate([72.281,67.493])hole(r=hole_size); //2X10 6
			  translate([74.821,64.953])hole(r=hole_size); //2X10 7
			  translate([74.821,67.493])hole(r=hole_size); //2X10 8
			  translate([77.361,64.953])hole(r=hole_size); //2X10 9
			  translate([77.361,67.493])hole(r=hole_size); //2X10 10
			  translate([79.901,64.953])hole(r=hole_size); //2X10 11
			  translate([79.901,67.493])hole(r=hole_size); //2X10 12
			  translate([82.441,64.953])hole(r=hole_size); //2X10 13
			  translate([82.441,67.493])hole(r=hole_size); //2X10 14
			  translate([84.981,64.953])hole(r=hole_size); //2X10 15
			  translate([84.981,67.493])hole(r=hole_size); //2X10 16
			  translate([87.520,64.953])hole(r=hole_size); //2X10 17
			  translate([87.520,67.493])hole(r=hole_size); //2X10 18
			  translate([90.061,64.953])hole(r=hole_size); //2X10 19
			  translate([90.061,67.493])hole(r=hole_size); //2X10 20
			}
			if (MOTOR_Z1) {
			  translate([49.463,4.648])hole(r=hole_size); //4POL254 1
			  translate([46.922,4.648])hole(r=hole_size); //4POL254 2
			  translate([44.383,4.648])hole(r=hole_size); //4POL254 3
			  translate([41.843,4.648])hole(r=hole_size); //4POL254 4
			}
			if (MOTOR_Z2) {
			  translate([62.163,4.648])hole(r=hole_size); //4POL254 1
			  translate([59.623,4.648])hole(r=hole_size); //4POL254 2
			  translate([57.083,4.648])hole(r=hole_size); //4POL254 3
			  translate([54.543,4.648])hole(r=hole_size); //4POL254 4
			}
			if (32U2_EXT) {
			  translate([34.925,47.625])hole(r=hole_size); //2X8 1
			  translate([32.385,47.625])hole(r=hole_size); //2X8 2
			  translate([34.925,50.165])hole(r=hole_size); //2X8 3
			  translate([32.385,50.165])hole(r=hole_size); //2X8 4
			  translate([34.925,52.705])hole(r=hole_size); //2X8 5
			  translate([32.385,52.705])hole(r=hole_size); //2X8 6
			  translate([34.925,55.245])hole(r=hole_size); //2X8 7
			  translate([32.385,55.245])hole(r=hole_size); //2X8 8
			  translate([34.925,57.785])hole(r=hole_size); //2X8 9
			  translate([32.385,57.785])hole(r=hole_size); //2X8 10
			  translate([34.925,60.325])hole(r=hole_size); //2X8 11
			  translate([32.385,60.325])hole(r=hole_size); //2X8 12
			  translate([34.925,62.865])hole(r=hole_size); //2X8 13
			  translate([32.385,62.865])hole(r=hole_size); //2X8 14
			  translate([34.925,65.405])hole(r=hole_size); //2X8 15
			  translate([32.385,65.405])hole(r=hole_size); //2X8 16
			}
			if (ICSP_M32U2) {
			  translate([22.035,67.755])hole(r=hole_size); //2X03 1
			  translate([22.035,70.294])hole(r=hole_size); //2X03 2
			  translate([24.575,67.755])hole(r=hole_size); //2X03 3
			  translate([24.575,70.294])hole(r=hole_size); //2X03 4
			  translate([27.114,67.755])hole(r=hole_size); //2X03 5
			  translate([27.114,70.294])hole(r=hole_size); //2X03 6
			}
			if (ICSP_M2560) {
			  translate([40.323,68.898])hole(r=hole_size); //2X03 1
			  translate([40.323,71.438])hole(r=hole_size); //2X03 2
			  translate([42.863,68.898])hole(r=hole_size); //2X03 3
			  translate([42.863,71.438])hole(r=hole_size); //2X03 4
			  translate([45.403,68.898])hole(r=hole_size); //2X03 5
			  translate([45.403,71.438])hole(r=hole_size); //2X03 6
			}
			if (ANALOG_EXT) {
			  translate([78.105,35.395])hole(r=hole_size); //1X08 1
			  translate([78.105,37.935])hole(r=hole_size); //1X08 2
			  translate([78.105,40.475])hole(r=hole_size); //1X08 3
			  translate([78.105,43.015])hole(r=hole_size); //1X08 4
			  translate([78.105,45.555])hole(r=hole_size); //1X08 5
			  translate([78.105,48.095])hole(r=hole_size); //1X08 6
			  translate([78.105,50.635])hole(r=hole_size); //1X08 7
			  translate([78.105,53.175])hole(r=hole_size); //1X08 8
			}
			if (ENDSTOP_ZMIN) {
			  translate([28.575,43.180])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([26.035,43.180])hole(r=hole_size); //70543-03 2
			    translate([23.495,43.180])hole(r=hole_size); //70543-03 3
			  }
			}
			if (ENDSTOP_YMIN) {
			  translate([18.415,43.180])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([15.875,43.180])hole(r=hole_size); //70543-03 2
			    translate([13.335,43.180])hole(r=hole_size); //70543-03 3
			  }
			}
			if (ENDSTOP_XMIN) {
			  translate([8.255,43.180])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([5.715,43.180])hole(r=hole_size); //70543-03 2
			    translate([3.175,43.180])hole(r=hole_size); //70543-03 3
			  }
			}
			if (ENDSTOP_ZMAX) {
			  translate([23.495,36.830])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([26.035,36.830])hole(r=hole_size); //70543-03 2
			    translate([28.575,36.830])hole(r=hole_size); //70543-03 3
			  }
			}
			if (ENDSTOP_YMAX) {
			  translate([13.335,36.830])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([15.875,36.830])hole(r=hole_size); //70543-03 2
			    translate([18.415,36.830])hole(r=hole_size); //70543-03 3
			  }
			}
			if (ENDSTOP_XMAX) {
			  translate([3.175,36.830])hole(r=hole_size); //70543-03 1
			  if (ENDSTOP_POWER) {
			    translate([5.715,36.830])hole(r=hole_size); //70543-03 2
			    translate([8.255,36.830])hole(r=hole_size); //70543-03 3
			  }
			}
			if (THERMISTOR0) {
			  translate([89.318,60.203])hole(r=hole_size); //70543-02 1
			  translate([89.318,57.663])hole(r=hole_size); //70543-02 2
			}
			if (THERMISTOR1) {
			  translate([89.318,52.329])hole(r=hole_size); //70543-02 1
			  translate([89.318,49.789])hole(r=hole_size); //70543-02 2
			}
			if (THERMISTOR2) {
			  translate([89.318,44.455])hole(r=hole_size); //70543-02 1
			  translate([89.318,41.915])hole(r=hole_size); //70543-02 2
			}
			if (THERMISTOR3) {
			  translate([89.318,36.581])hole(r=hole_size); //70543-02 1
			  translate([89.318,34.041])hole(r=hole_size); //70543-02 2
			}
			if (12V_AUX) {
			  translate([96.209,22.783])hole(r=hole_size); //70543-02 1
			  translate([98.749,22.783])hole(r=hole_size); //70543-02 2
			}
			if (MOTOR_EXT1) {
			  translate([61.420,34.925])hole(r=hole_size); //1X05 1
			  translate([61.420,37.465])hole(r=hole_size); //1X05 2
			  translate([61.420,40.005])hole(r=hole_size); //1X05 3
			  translate([61.420,42.545])hole(r=hole_size); //1X05 4
			  translate([61.420,45.085])hole(r=hole_size); //1X05 5
			}
			if (MOTOR_EXT2) {
			  translate([63.960,34.925])hole(r=hole_size); //1X05 1
			  translate([63.960,37.465])hole(r=hole_size); //1X05 2
			  translate([63.960,40.005])hole(r=hole_size); //1X05 3
			  translate([63.960,42.545])hole(r=hole_size); //1X05 4
			  translate([63.960,45.085])hole(r=hole_size); //1X05 5
			}
			if (MOTOR_EXT3) {
			  translate([66.500,34.925])hole(r=hole_size); //1X05 1
			  translate([66.500,37.465])hole(r=hole_size); //1X05 2
			  translate([66.500,40.005])hole(r=hole_size); //1X05 3
			  translate([66.500,42.545])hole(r=hole_size); //1X05 4
			  translate([66.500,45.085])hole(r=hole_size); //1X05 5
			}
			if (VIN) {
			  translate([95.758,60.960])hole(r=hole_size); //MSTBA6 1
			  translate([95.758,66.040])hole(r=hole_size); //MSTBA6 2
			  translate([95.758,71.120])hole(r=hole_size); //MSTBA6 3
			  translate([95.758,76.200])hole(r=hole_size); //MSTBA6 4
			  translate([95.758,81.280])hole(r=hole_size); //MSTBA6 5
			  translate([95.758,86.360])hole(r=hole_size); //MSTBA6 6
			}
			if (PWM_EXT) {
			  translate([50.800,71.755])hole(r=hole_size); //1X06 1
			  translate([53.340,71.755])hole(r=hole_size); //1X06 2
			  translate([55.880,71.755])hole(r=hole_size); //1X06 3
			  translate([58.420,71.755])hole(r=hole_size); //1X06 4
			  translate([60.960,71.755])hole(r=hole_size); //1X06 5
			  translate([63.500,71.755])hole(r=hole_size); //1X06 6
			}
			if (EXTRA_PINS0) {
			  translate([17.780,86.360])hole(r=hole_size); //1X02 1
			  translate([20.320,86.360])hole(r=hole_size); //1X02 2
			}
			if (EXTRA_PINS1) {
			  translate([22.860,86.360])hole(r=hole_size); //1X02 1
			  translate([25.400,86.360])hole(r=hole_size); //1X02 2
			}
			if (EXTRA_PINS2) {
			  translate([27.940,86.360])hole(r=hole_size); //1X02 1
			  translate([30.480,86.360])hole(r=hole_size); //1X02 2
			}
			if (EXTRA_PINS3) {
			  translate([61.595,86.360])hole(r=hole_size); //1X02 1
			  translate([64.135,86.360])hole(r=hole_size); //1X02 2
			}
			if (SERIAL) {
			  translate([42.545,34.390])hole(r=hole_size); //AVR_ICSP 1
			  translate([40.005,34.390])hole(r=hole_size); //AVR_ICSP 2
			  translate([42.545,36.930])hole(r=hole_size); //AVR_ICSP 3
			  translate([40.005,36.930])hole(r=hole_size); //AVR_ICSP 4
			  translate([42.545,39.470])hole(r=hole_size); //AVR_ICSP 5
			  translate([40.005,39.470])hole(r=hole_size); //AVR_ICSP 6
			  translate([42.545,42.010])hole(r=hole_size); //AVR_ICSP 7
			  translate([40.005,42.010])hole(r=hole_size); //AVR_ICSP 8
			  translate([42.545,44.550])hole(r=hole_size); //AVR_ICSP 9
			  translate([40.005,44.550])hole(r=hole_size); //AVR_ICSP 10
			}
			if (VREFS) {
			  translate([8.572,24.448])hole(r=hole_size); // X-REF
			  translate([26.629, 25.241])hole(r=hole_size); // Y-REF
			  translate([46.355, 24.924])hole(r=hole_size); // Z-REF
			  translate([64.594, 25.665])hole(r=hole_size); // E0-REF
			  translate([82.991, 25.165])hole(r=hole_size); // E1-REF
			}

		}
	}
}

module RAMBo1_2() {
  // TODO
}

module RAMBo() {
  if (RAMBO_TYPE == "1.1")
    RAMBo1_1();
  else
    RAMBo1_2();
}
