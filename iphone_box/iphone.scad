iW=57;
iH=124;
iL=8;
iC=9;

module iphone_center() {
    cube([57,100,iL]);
}

module corner() {
    difference() {
        cylinder(iL,r=iC);
        translate([-10,0,-1])
            cube([20,iC+1,20]);
    }
}
module iphone_top() {
    translate([iC,iC,0])
        corner();
    translate([iW-iC,iC,0])
        corner();
    translate([iC,0,0])
        cube([iW-iC-iC,iC,iL]);
    translate([0,iC,0])
        cube([iW,2,iL]);
    translate([1,11,0])
        cube([55,1,iL]);
}

module iphone() {
    translate([0,12,0])
        iphone_center();
    translate([0,0,0])
        iphone_top();
    translate([iW,iH,0])
        rotate([0,0,180])
            iphone_top();
}

iphone();