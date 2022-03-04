TOP_CAP = 58;
TOP_CAP_MARGIN = 5;
PD_TOP_CAP = 48;
PD_TOP_MARGIN = 3;


module support(cap1, cap2, e1, e2) {
    linear_extrude(e1)
        circle(d=cap1);
    translate([0,0,-e2+1])
        linear_extrude(e2)
            circle(d=cap2);
}

difference() { 
    support(TOP_CAP, TOP_CAP - TOP_CAP_MARGIN*2, 2, 6);
    translate([0,0,1])
        support(PD_TOP_CAP, PD_TOP_CAP - PD_TOP_MARGIN*2, 2, 10);
}

