# RAMBO Test Jig
These files are just a proof of concept of how a test jig for the RAMBo board could be built.
The board, dimensions, etc.. are all random values and do not represent the real life size
of any of the objects.

# Assembly
You can open the bottom_assembly.scad in openscad and enable the Animate option (FPS=10,Steps=100 seems like a good value)
in order to see how the bottom is assembled. The same applies for top_assembly.scad. Finally, the assembly.scad file will
show the assembly of the whole system for testing.

# Bottom Assembly
The bottom would have a holder in which you can place a PCB with pogo pins, it will then lock itself into a
base platform.

# Top assembly
The top side will have holes for pogo pins, once the pogo pins are in, you can solder to them (and find a way to hold
them in place) then pull the wires out of the hole reserved for them. Then a cap will close the top so the pogo pins don't get pushed out of the frame

# System test
The RAMBo board would be put on the pins through the hole screws and guided to the bottom board where the pogo pins make contact.
The platform has washers on which the rambo board should rest. Then throug the same pins the top side of the assembly gets inserted and pushed into the board, thus making contact on both the top of bottom of the board.
Once the RAMBo board is securely clamped between the bottom and top assembly, a board_tab_clamp can be used to secure both the board and the top assembly to keep contact between the pogo pins and the board secured. The test can then be performed.
Note that the board_tab_clamp as well as the frame in which the clamp would be held were not designed yet, but a structure should be coming out of the bottom part with two clamps (one for the RAMBo and one for the top assembly) on each of the 4 corners.

