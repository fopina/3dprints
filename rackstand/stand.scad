L = 77;
L2 = L/2;
W = 40;
H = 50;

Points = [
  [ 0,  0,  0], // 0
  [ L,  0,  0], // 1
  [ 0,  W,  0], // 2
  [ L,  W,  0], // 3
  [L2,  0,  H], // 4
  [L2,  W,  H], // 5
];

Faces = [
  [0,1,4],  // triangle1
  [2,3,5],  // triangle2
  [0,1,3,2],  // bottom
  [0,2,5,4],  // right
  [1,3,5,4],  // back
];


polyhedron(Points, Faces);

// FAIL: cannot use difference, rendering breaks... #FIXME