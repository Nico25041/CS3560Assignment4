//Code Reference: Coding Train 3 x 3 Rubics Cube

class Cubie {
  PMatrix3D matrix;
  int x, y, z;
  color c;
  Face[] faces;

  // Constructor
  Cubie(PMatrix3D m, int x_, int y_, int z_) {
    this.matrix = m;
    this.x = x_;
    this.y = y_;
    this.z = z_;
    this.c = color(255);  // default color
    faces = createFaces(); // initialize faces
  }

  // Initialize the faces of the cubie
  Face[] createFaces() {
    return new Face[] {
      new Face(new PVector(0, 0, -1), color(0, 0, 255)),    // blue
      new Face(new PVector(0, 0, 1), color(0, 255, 0)),     // green
      new Face(new PVector(0, 1, 0), color(255, 255, 255)), // white
      new Face(new PVector(0, -1, 0), color(255, 255, 0)),  // yellow
      new Face(new PVector(1, 0, 0), color(255, 150, 0)),   // orange
      new Face(new PVector(-1, 0, 0), color(255, 0, 0))     // red
    };
  }

  // Update position and matrix transformation
  void update(int x, int y, int z) {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  // Apply transformation to faces based on the Z-axis rotation
  void turnFaceZ(int dir) {
    float angle = dir * HALF_PI;
    for (int i = 0; i < faces.length; i++) {
      faces[i].turnZ(angle);
    }
  }

  // Apply transformation to faces based on the Y-axis rotation
  void turnFaceY(int dir) {
    float angle = dir * HALF_PI;
    for (int i = 0; i < faces.length; i++) {
      faces[i].turnY(angle);
    }
  }

  // Apply transformation to faces based on the X-axis rotation
  void turnFaceX(int dir) {
    float angle = dir * HALF_PI;
    for (int i = 0; i < faces.length; i++) {
      faces[i].turnX(angle);
    }
  }

  // Display the cubie and its faces
  void show() {
    noFill();
    stroke(0);
    strokeWeight(0.1);
    
    pushMatrix();
    applyMatrix(matrix);  // Apply current matrix transformations
    box(1);               // Draw the cube itself
    
    // Draw all the faces
    for (int i = 0; i < faces.length; i++) {
      faces[i].show();
    }
    
    popMatrix();
  }
}
