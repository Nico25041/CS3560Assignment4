//Code Reference: Coding Train 3 x 3 Rubics Cube

class Face {
  PVector normal; // The normal vector representing face orientation
  color c;        // Color of the face

  // Constructor
  Face(PVector normal, color c) {
    this.normal = normal.copy();  // Use a copy of the vector to avoid reference issues
    this.c = c;                   // Assign color
  }

  // Method to apply Z-axis rotation
  void turnZ(float angle) {
    normal = rotateVector(normal, angle, 'z');
  }

  // Method to apply Y-axis rotation
  void turnY(float angle) {
    normal = rotateVector(normal, angle, 'y');
  }

  // Method to apply X-axis rotation
  void turnX(float angle) {
    normal = rotateVector(normal, angle, 'x');
  }

  // Generic method to rotate the vector based on axis
  PVector rotateVector(PVector v, float angle, char axis) {
    PVector v2 = new PVector();
    
    switch(axis) {
      case 'z':
        v2.x = round(v.x * cos(angle) - v.y * sin(angle));
        v2.y = round(v.x * sin(angle) + v.y * cos(angle));
        v2.z = round(v.z);  // Z-axis remains the same
        break;
        
      case 'y':
        v2.x = round(v.x * cos(angle) - v.z * sin(angle));
        v2.z = round(v.x * sin(angle) + v.z * cos(angle));
        v2.y = round(v.y);  // Y-axis remains the same
        break;
        
      case 'x':
        v2.y = round(v.y * cos(angle) - v.z * sin(angle));
        v2.z = round(v.y * sin(angle) + v.z * cos(angle));
        v2.x = round(v.x);  // X-axis remains the same
        break;
    }
    
    return v2;
  }

  // Display the face using the current normal orientation
  void show() {
    pushMatrix();   // Save the current matrix state
    fill(c);        // Apply the face's color
    noStroke();
    rectMode(CENTER);
    
    // Translate based on the normal vector
    translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
    
    // Apply rotations based on the orientation of the normal
    if (abs(normal.y) > 0) {
      rotateX(HALF_PI);
    } else if (abs(normal.x) > 0) {
      rotateY(HALF_PI);
    } else if (abs(normal.z) > 0) {
      rotateZ(HALF_PI);
    }
    
    // Draw the face as a square
    square(0, 0, 1);
    
    popMatrix();  // Restore the previous matrix state
  }
}
