// 60*15*40
// 20*30*3
use <../_common/roundedcube.scad>;

/*
roundedcube(
    [60,40,15],
    true, 3
);
*/

RH = 18;
RW = 40;
RL = 60;

OFF = 1;
BW = 2;
ICH = 5;

HW = 25;
HL = 10;
WW = 5;

MAR=OFF*2+BW*2;

module remote(l=0,w=0,h=0) {
    cube([RL+l,RW+w,RH+h]);
}

module case_remote() {
    difference() {
        // box for the case
        cube([RL+MAR,RW+MAR,RH+MAR]);
        // hole for remote
        translate([BW,BW,BW])
            remote(l=500,w=OFF*2,h=OFF*2);
        // top hole to view remote
        translate([7,(RW+MAR-HW)/2,RH+BW])
            cube([RL+MAR,HW,BW*3]);
        // hole for IC
        translate([-BW,BW+OFF+2.5,BW])
            cube([RL,35,RH+OFF*2]);
    }
}

module case_ic() {
    difference() {
        cube([HL,RW+MAR,RH+MAR]);
        translate([BW,BW,BW])
            cube([RL,RW+OFF*2,RH+OFF*2]);
    }
}

module case() {
    difference() {        
        union() {
            case_remote();
            translate([-HL,0,0])
                case_ic();
        }
        // wire hole
        translate([-WW,(RW+MAR-WW)/2,RH+BW])
            cube([HL+HL,WW,BW*3]);
    }
}

// remote placeholder, for reference
//color("grey") translate([BW+OFF,BW+OFF,BW+OFF]) remote();

// size test
//difference() { case(); translate([20,-5,-50]) cube([100, 100, 100]);}

color("green") case();
