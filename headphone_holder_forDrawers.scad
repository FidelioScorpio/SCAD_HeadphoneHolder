$fn=180;

difference()
{
	translate([0,0,hh_dist/2 + circle_d/2])
	rotate([90,0,0])
	union()
	{
		// to change viewpoint  x,  y,  z
		//           then edit  x, -z,  y
		translate([-25,-hh_dist/2,-circle_d/2]) rotate([0,90,0])
		linear_extrude(height=50) handle_hook();

		difference()
		{
			translate([0,50,-4]) import("sennheiser_holder.stl");
			
			// Remove the top cube that was for the sticky tape
			translate([-25,55,-10]) cube([50,50,10]);
		}
	}

	// Cut the sides of the holder off
	color("red")  translate([25, -70, -5]) cube([circle_d, 80, hh_dist + 2*circle_d]);
	color("red")  translate([-25-circle_d, -70, -5]) cube([circle_d, 80, hh_dist + 2*circle_d]);

}




















// handle_hook vars
hh_dist = 102;
circle_d = 20;
h_gap_d = 7;

module handle_hook()
{
	difference()
	{
		union()
		{
			circle(d=circle_d);

			translate([0, hh_dist]) circle(d=circle_d);

			translate([-circle_d/2, 0]) square([circle_d/2, hh_dist]);
		}
		translate([1,0]) cutout();
		translate([1,hh_dist]) cutout();
	}
}
module cutout()
{
	hull()
	{
		translate([-2,-10]) circle(d=h_gap_d); // headset side
		translate([4,-10]) circle(d=h_gap_d); // drawer side
		translate([0,0]) circle(d=h_gap_d); // top
		translate([5,-30]) circle(d=h_gap_d); // bottom
	}
}