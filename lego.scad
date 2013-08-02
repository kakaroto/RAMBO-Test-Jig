/*
 * Modified lego code originally copied from canadaduane:
 * https://github.com/canadaduane/Things/blob/master/Lego/lego.scad
 */
 
// Exterior thickness
lego_thickness=2;
wall_thickness=lego_thickness / 5;

// Knobs are the circles on top of blocks
knob_diameter=lego_thickness - (wall_thickness * 2);
knob_height=lego_thickness * 2  / 3;
knob_spacing=knob_diameter * 3/2;


// The 'positive space' of a lego block
module lego_positive(length) {
  num = ((length - (wall_thickness * 2)) / knob_spacing );
  union()
  {
    cube([length, lego_thickness, lego_thickness]);
    translate([knob_diameter / 2 + wall_thickness,
               knob_diameter / 2 + wall_thickness, 0])
      for (xcount=[0:num-1])
        {
          translate([xcount * knob_spacing, 0, lego_thickness])
            cylinder(r=knob_diameter / 2, h=knob_height);
        }
  }
}
 
// The 'negative space' of a lego block
module lego_negative(length) {
  num = ((length - (wall_thickness * 2)) / knob_spacing ) + 1;
  difference()
    {
      translate([wall_thickness, wall_thickness, -0.1])
        cube([length - wall_thickness * 2,
              lego_thickness - wall_thickness * 2,
              knob_height]);
      for (xcount=[1:num-1])
        translate([xcount * knob_spacing, lego_thickness / 2, -0.1])
          cylinder(r=knob_diameter/4,h=knob_height);
    }
}
