/*
key measurements:
handle:
* rounded square 3cm*3cm
* hole - from 0.2cm to 1.1 cm in height, 0.6 to 2.3 in width
* 1cm thick

key:
* 0.9 width
* 0.2 thick
*/

use <../_common/roundedcube.scad>;
$fs = 0.15;

// WALL thickness
WS = 2;
// CASE Side (square)
CS = 37;
// CASE Height
CH = 10;
// KEYENTRY space - W x H
KE = [11, 4];

module key() {
    rotate([180,0,0])
    translate([-15,-15,-5])
    scale([2.5,2.5,10])
        translate([-6,-2.5,0])
            linear_extrude(1)
                import("key.svg");
}

module ttext(msg, direction="ltr", size=10, extrude=1) {
    linear_extrude(extrude)
        text(
            msg,
            halign="center",
            size=size,
            valign="center",
            direction=direction
        );
}

module ringhole(extrude=10, rx=18, ry=9.5) {
    translate([0,CS/2-7,-extrude/2])
        resize([rx,ry])
            linear_extrude(extrude)
                circle(r=1);
}

module keyhole() {
    translate([0,-CS/2,0])
        cube([KE[0],10,KE[1]], center=true);
}

module cover() {
    union() {
        difference() {
            roundedcube(
                [CS,CS,CH],
                true, 3
            );
            // keyring hole
            difference() {
                ringhole(extrude=12);
                translate([0,17,0])
                    cube([40,4,20], center=true);
            }
            // key hole
            keyhole();
            // case empty space 
            roundedcube(
                [CS-2*WS,CS-2*WS,CH-WS],
                true, 3
            );
            translate([0,-1,4.5]) 
                ttext("SF");
            translate([-4,-10,4.5]) 
                ttext("40",size=5.5);
            translate([0,-7,-5.5])
                ttext(
                    "volvo",
                    size=5, 
                    direction="rtl"
                );
        }
        // keyring hole
        difference() {
            ringhole();
            translate([0,17,0])
                cube([40,4,20], center=true);
            ringhole(extrude=20,rx=16,ry=8);
        }
    }
}

module front_cover() {
    difference() {
        cover();
        translate([0,0,-25])
            cube(50, center=true);
        gluesticks();
    }
}

module back_cover() {
    rotate([0,180,0])
        union() {
            difference() {
                cover();
                translate([0,0,25])
                    cube(50, center=true);
            }
            gluesticks();
        }
}

module gluesticks(e=0) {
    gluestick(e=e);
    gluestick(e=e,p=-1);
    gluestick(e=e,r=90);
    difference() {
        gluestick(e=e,r=90,p=-1);
        keyhole();
    }
}

module gluestick(f=0.6,p=1,r=0,e=0) {
    rotate(r)
        translate([CS/2*p-3*WS/4*p-e*WS/4*p,0,WS/4])
            cube([1+e,CS*f,1+e], center=true);
}

module demo() {
    #key();
    cover();
    translate([50,0,0]) front_cover();
    translate([-50,0,0]) back_cover();
}

demo();
//front_cover();
//back_cover();
