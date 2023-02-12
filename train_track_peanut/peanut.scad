// diameter
D = 11;
// full connection length
L = 17;
// connection width
W = 6;
// thickness
T = 12;

module conn() {
    union() {
        circle(d=D, $fn=50);
        translate([6.5,0,0])
            square([L-7, W], center=true);
    }
}

linear_extrude(T) {
    conn();
    translate([22.5,0,0]) rotate(180) conn();
}
    