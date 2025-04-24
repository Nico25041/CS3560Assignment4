//Code Reference: Coding Train 3 x 3 Rubics Cube

import peasy.*;
PeasyCam cam;
int dim = 3;
Cubie[] cube = new Cubie[dim * dim * dim];

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);

  int index = 0;
  for (int x = -1; x <= 1; x++){
    for (int y = -1; y <= 1; y++){
      for (int z = -1; z <= 1; z++){
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index++] = new Cubie(matrix, x, y, z);
      }
    }
  }
}

void turnX(int index, int dir){
  for (Cubie qb : cube){
    if (qb.x == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFaceX(dir);
    }
  }
}

void turnY(int index, int dir){
  for (Cubie qb : cube){
    if (qb.y == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFaceY(dir);
    }
  }
}

void turnZ(int index, int dir){
  for (Cubie qb : cube){
    if (qb.z == index){
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.update(round(matrix.m02), round(matrix.m12), qb.z);
      qb.turnFaceZ(dir);
    }
  }
}

void keyPressed(){
  switch (key){
    case 'l': turnZ(-1, 1); break;
    case 'r': turnZ(1, 1); break;
    case 'u': turnY(-1, 1); break;
    case 'd': turnY(1, 1); break;
    case 'f': turnX(-1, 1); break;
    case 'b': turnX(1, 1); break;
    case 's': turnZ(0, 1); break;
    case 'e': turnY(0, 1); break;
    case 'm': turnX(0, 1); break;
    case 'L': turnZ(-1, -1); break;
    case 'R': turnZ(1, -1); break;
    case 'U': turnY(-1, -1); break;
    case 'D': turnY(1, -1); break;
    case 'F': turnX(-1, -1); break;
    case 'B': turnX(1, -1); break;
    case 'S': turnZ(0, -1); break;
    case 'E': turnY(0, -1); break;
    case 'M': turnX(0, -1); break;
  }
}

void draw(){
  background(250);
  scale(50);
  for (Cubie qb : cube){
    qb.show();
  }
}
