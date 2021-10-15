use <iphone.scad>;

module ibox() {
    cube([78,142,43]);
}

module bottom() {
    difference() {
        scale([1.7,1.7,8])
            iphone();
        translate([6,-10,5])
            cube([85,200,54]);
        translate([-10,-10,5])
            cube([110,30.4,54]);
    }
}

module lid() {
    difference() {
        scale([1.7,1.7,8])
            iphone_top();
        translate([-1,-50,-1])
            cube([100,100,8]);
        translate([-1,-50,58])
            cube([100,100,8]);
    }
}

bottom();
translate([0,-50,0])
    lid();
translate([10,25,10])
    color("red",0.5)
        ibox();