# RAMBO Test Jig
These files are the scad sources of a Test Jig used for testing RAMBo boards. It is still incomplete but should be close to final version.
This Test Jig design is based on the Test Jig designed by sjkelly from Ultimachine (https://github.com/ultimachine/Test-Jig) but is much simpler to build. 
You will need to have Magpie installed or copied to this directory for the scad to generate correctly.

# Instructions
First, you should print the calibration-test file which will help you decide which size of holes to use for your printed boards. I have found that
my printer was not accurate enough (or not well calibrated) so the hole sizes were not very accurate, but a small enough size is good enough to keep
board integrity (we don't want the middle lines to break in the 3x2 header for example) and big enough to appear correctly and guide a drill into them.
I have drilled every hole in my boards and found correct drill sizes that allow the pogo pins to fit nicely.
Another important file is configuration.scad, where you can specify the size of the holes, the radius and width/height of M3 bolt and nut, the size of the clamps, etc...
Once it's done, you should print the foot, bottom_spacer, board_spacer, RAMBo bottom plate, middle plate and top plate with clamps, the simple encoder and the motor and opto mounts.
Here is the list of files and what they are used for :
calibration-test.scad : Calibration print to test hole sizes and printer accuracy
configuration.scad : Hols configuration of sizes to use for other parts
common.scad : Main include, has some helper functions used by multiple modules
RAMBo.scad : RAMBo board definition. Do not print
foot.scad : The foot of the wooden plaque on which to build the jig
bottom_spacer.scad : Spacer between the wooden plaque and the jig. Is used to keep jumper cables away from the wooden plaque
board_spacer.scad : Spacer between the bottom board and the middle one
RAMBo_bottom_plate.scad : Bottom plate on which to insert pogo pins
RAMBo_middle_plate.scad : Middle plate on which the top of the pogo pins goes
RAMBo_top_plate.scad : Top plate. Do not print
RAMBo_top_plate_with_clamp.scad : Top plate including clamps
motor_mount.scad : Mount to hold the motors to the wooden plaque
opto_mount.scad : Mount to hold the opto endstop to the motor

All files have had their STL generated and saved in the stl directory. The only missing element is the encoder flag which was copied from Ultimachine's test jig repository.

# Assembly
The assembly is simple, first screw the feet to the wooden plaque, drill holes in it for all the elements that it will hold, insert M3 rods into holes and use bottom spacer to separate the wooden plaque with the bare PCB, then add the bottom plate, the board spacer, then middle plate. Insert pogo pins, solder them if you want to, and tighten everything.
Install clamps to the top board, and test the system. 
Hold the motors with the motor_mount, and attach the opto endstop to the opto mount and attach it to the motor. insert the encoder in the motor, and screw everything to the wooden plaque.
Use a RAMBo as controller, remove all resistors/capacitors from the thermistor area, and connect everything.
Use 4.7KOhm and 47KOhm resistors as voltage divider for your supply rail tests, and a 100KOhm resistor for the thermistor tests.

# Pin mapping
Endstops :
 Xmin to EXT2-10
 Ymin to EXT2-12 
 Zmin to EXT2-14 
 Xmax to EXT2-16 
 Ymax to EXT2-18  
 Zmax to EXT2-20 
Mosfets :
 Heat0 to MX3-4
 Fan0 to MX3-5
 Heat1 to MX2-4
 Fan1 to MX2-5
 Heat-Bed to MX1-5
 Fan2 to MX1-4
VRefs:
 XRef to Analog-Ext-8
 YRef to Analog-EXT-6
 ZRef to Analog-EXT-5
 E0-Ref to Analog-EXT-4
 E1-Ref to Analog-EXT-3
Supply voltage:
 Extruder rail (Heat0+) to T3
 Bed rail (Heat-Bed+) to T2
 5V rail (VCC middle pin of power selector jumper) to T0
For the supply voltage, we need a 47KOhm resistor between VCC and Tx and a 4.7KOhm resistor between Tx and the ground (R1, R2 according to Ohm's law to get a divider of voltage of 0.91)
Thermistor connectors connected to a 100KOhm resistor
Motors connected to normal motors
Opto-endstops for controller :
 X opto endstop to EXT2-9
 Y opto endstop to EXT2-11
 Z opto endstop to  EXT-15
 E0 opto endstop to EXT-17
 E1 opto endstop to EXT-19
