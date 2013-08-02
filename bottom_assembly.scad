use <rambo.scad>
use <bottom.scad>

module bottom() {
  translate([7.5, 2.5, 0]) bottom_holder();
  if ($t < 0.5) {
    assign (animation = ($t/0.5)) 
      translate ([10, 5, 11 - (animation * 10)] ) rambo(0, 0, 1);
  } else if ($t < 1.0) {
    translate ([10, 5, 1] ) rambo(0, 0, 1);
    assign (animation = (($t-0.5)/0.5))
      translate ([0, 0, 15 - (animation * 15)] ) bottom_cap();
  } else {
    translate ([10, 5, 1] ) rambo(0, 0, 1);
    bottom_cap();
  }
}

bottom();