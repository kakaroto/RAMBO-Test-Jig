/*
 * Motor mount for RAMBo Test Jig
 * Designed by Youness Alaoui (kakaroto)
 *
 * Motor mount design adapted from Hoeken's NEMA17 mount http://www.thingiverse.com/thing:5166
 */
include <common.scad>

module nema_17_mount()
{
  wall_thickness = MOTOR_MOUNT_THICKNESS;
  motor_width = 42;
  frame_width = motor_width + (wall_thickness + 1)*2;
  height = 25;
	
  //these are all the mount point holes.
  x1 = -wall_thickness;
  y1 = wall_thickness*2;
  x2 = frame_width+wall_thickness;
  y2 = wall_thickness*2;
  x3 = -wall_thickness;
  y3 = frame_width-wall_thickness*2;
  x4 = frame_width + wall_thickness;
  y4 = frame_width-wall_thickness*2;
	
  //center the whole thing in X
  translate([-frame_width/2, 0, 0])
    {
      difference()
	{
	  //build the main unit.
	  union()
	  {
	    //structure
	    cube([wall_thickness, frame_width, frame_width]); //left face
	    cube([frame_width, wall_thickness, frame_width]); //front face
	    translate([frame_width-wall_thickness, 0, 0])     //right face
	      cube([wall_thickness, frame_width, frame_width]);

	    //front left sphere
	    translate([-wall_thickness*2, 0, 0])
	      cube([wall_thickness*2, wall_thickness * 4, wall_thickness]);
				
	    //front right sphere
	    translate([frame_width, 0, 0])
	      cube([wall_thickness*2, wall_thickness * 4, wall_thickness]);

	    //back left sphere
	    translate([-wall_thickness*2, frame_width-wall_thickness*4, 0])
	      cube([wall_thickness*2, wall_thickness * 4, wall_thickness]);

	    //back right sphere
	    translate([frame_width, frame_width-wall_thickness*4, 0])
	      cube([wall_thickness*2, wall_thickness * 4, wall_thickness]);
	  }

          if (MOTOR_MOUNT_USE_HEATSET_INSERTS) {
	      //front left mount hole
	      translate([x1, y1, 0])
	      cylinder(r=M3_HEATSET_RADIUS, h=wall_thickness);
			
	      //front right mount hole
	      translate([x2, y2, 0])
	      cylinder(r=M3_HEATSET_RADIUS, h=wall_thickness);
			
	      //rear left mount hole
	      translate([x3, y3, 0])
	      cylinder(r=M3_HEATSET_RADIUS, h=wall_thickness);
			
	      //rear right mount hole
	      translate([x4, y4, 0])
	      cylinder(r=M3_HEATSET_RADIUS, h=wall_thickness);
          } else {
	      //front left mount hole
	      translate([x1, y1, 0])
	      cylinder(r=MOUNT_SCREW_RADIUS, h=wall_thickness);
			
	      //front right mount hole
	      translate([x2, y2, 0])
	      cylinder(r=MOUNT_SCREW_RADIUS, h=wall_thickness);
			
	      //rear left mount hole
	      translate([x3, y3, 0])
	      cylinder(r=MOUNT_SCREW_RADIUS, h=wall_thickness);
			
	      //rear right mount hole
	      translate([x4, y4, 0])
	      cylinder(r=MOUNT_SCREW_RADIUS, h=wall_thickness);
          }
			
	  //nema 17 mount
	  rotate([90, 0, 0])
	    {
	      translate([frame_width/2+0.5, height, -wall_thickness])
		{
		  translate([MOTOR_HOLE_DISTANCE/2, MOTOR_HOLE_DISTANCE/2, 0])
		    cylinder(r=M3_RADIUS, h=wall_thickness+1);
		  translate([-MOTOR_HOLE_DISTANCE/2, MOTOR_HOLE_DISTANCE/2, 0])
		    cylinder(r=M3_RADIUS, h=wall_thickness+1);
		  translate([MOTOR_HOLE_DISTANCE/2, -MOTOR_HOLE_DISTANCE/2, 0])
		    cylinder(r=M3_RADIUS, h=wall_thickness+1);
		  translate([-MOTOR_HOLE_DISTANCE/2, -MOTOR_HOLE_DISTANCE/2, 0])
		    cylinder(r=M3_RADIUS, h=wall_thickness+1);

		  cylinder(r=11.5, h=wall_thickness+1);

		  translate([-11.5, 0, 0])
		    cube([23, frame_width, wall_thickness+1]);
		}
	    }

	  //back slant cutaway
	  translate([0, 0, frame_width+wall_thickness])
	    rotate([45, 0, 0])
	    translate([-frame_width, 0, -frame_width*2])
	    cube(size=[frame_width*4, frame_width*2, frame_width*4]);

	  //front anti-warp circle
	  translate([frame_width/2, wall_thickness*1.25, 0])
	    rotate([90, 0, 0])
	    cylinder(r=wall_thickness, h=wall_thickness*2);

	  //middle anti-warp circle			
	  translate([0, motor_width/2 + wall_thickness, 0])
	    rotate([0, 90, 0])
	    cylinder(r=wall_thickness, h=frame_width+1);

	  //cutout / tidy up cubes.
	  translate([wall_thickness, wall_thickness-0.1, -1])
	    cube([frame_width-wall_thickness*2, frame_width-wall_thickness, motor_width*2]);
	  translate([-frame_width/2,-frame_width/2, frame_width])
	    cube([frame_width*2, frame_width*2, frame_width]);
	  translate([-frame_width/2, -frame_width/2,-frame_width])
	    cube([frame_width*2, frame_width*2, frame_width]);
	}
    }
}

nema_17_mount();
