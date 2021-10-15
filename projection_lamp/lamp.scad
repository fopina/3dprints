module bottom(h=30, d=80, w=5) {
    difference() {
        cylinder(h, d=d, $fn=80);
        translate([0,0,-1])
            cylinder(h+2, d=d-w, $fn=80);
    }
}

module top() {
    difference() {
        sphere(d=120, $fn=80);
        sphere(d=117.5, $fn=80);
        translate([-100,-100,-155])
            cube(200);
    }
}

module lamp() {
    bottom();
        translate([0,0,-15])
    top();
    //fin();
}

module fin(h=1, d=80, w=5) {
    difference() {
        cylinder(h, d=d+3, $fn=80);
        translate([0,0,-1])
            cylinder(h+2, d=d-w, $fn=80);
        translate([0,-d,-1])
            cube(d*2);
    }
}

module lid(h=2.5, d=80, w=5) {
    cylinder(1, d=d+3+0.5, $fn=80);
    difference() {
        cylinder(h, d=d+3+0.5, $fn=80);
        translate([0,0,-1])
            cylinder(h+2, d=d+3+0.5-w, $fn=80);
        translate([0,0,1])
            cylinder(1, d=d+3-0.5, $fn=80);

        translate([0,-d,-1])
            cube(d*2);
    }
}

module moon() {
    linear_extrude(20)
    scale(0.1)
        import("moon.svg");
}

module star(s=0.05) {
    linear_extrude(20)
        scale(s)
            import("star.svg");
}

//#lid();
//bottom(h=2);
difference() {
    lamp();
    translate([-10,-15,30]) moon();
    translate([-9,-27,30]) star();
    translate([-15,-35,30]) star(0.03);
    translate([10,-15,30]) star(0.04);
    translate([20,0,30]) star(0.04);
    translate([10,-30,30]) star(0.03);
    translate([5,8,30]) star(0.04);
    translate([-10,15,30]) star(0.03);
    translate([-5,30,30]) star(0.03);
    translate([-20,25,30]) star(0.04);
    translate([-28,0,30]) star(0.04);
    translate([-28,-15,30]) star(0.03);
    translate([15,20,30]) star(0.03);
    translate([-33,12,30]) star(0.035);
}
