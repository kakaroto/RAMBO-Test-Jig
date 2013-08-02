use <rambo.scad>
use <bottom_assembly.scad>
use <top_assembly.scad>

module center() {
  if ($t < 0.25) {
    assign (animation = ($t/0.25))
    translate ([10, 5, 38.5 - (animation * 25)] )rambo();
  } else {
    translate ([10, 5, 13.5] ) rambo();
  }
}

assign($t = 1.0) bottom();
center();
if ($t < 0.25) {
 } else if ($t < 0.5) {
  assign (animation = (($t - 0.25) / 0.25))
    translate ([0, 0, 32 - (animation * 10)]) 
    assign($t = 1.0) top();
} else {
  translate ([0, 0, 22]) assign($t = 1.0) top();
}
