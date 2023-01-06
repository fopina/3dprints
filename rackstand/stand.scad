// bottom length - more than 90 recommended but currently limited by a small print bed
L = 90;
L2 = L/2;
// width
W = 30;
// height
H = 90;

// hole space to fit the server (~44 for Dell R620 - 1U)
S = 45;
// bottom height (removed "ear" otherwise it needs to be > 26 >> more printing time)
BH = 15;

difference() {
    linear_extrude(W)
        polygon([
            [ 0, 0],
            [ L, 0],
            [L2, H],
        ]);
    translate([(L-S)/2, BH, -50])
        cube([S, 100, 100]);
}