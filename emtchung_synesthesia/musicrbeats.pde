void rectPoly (float x, float y, float radius) {
  float angle = TWO_PI / 4;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void trig (float x, float y, float radius) {
  float angle = TWO_PI / 3;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + sin(a) * radius;
    float sy = y + cos(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void star (float x, float y, float outSize, float inSize) {
  int nSides = 5;
  float outsideRadius = outSize;
  float insideRadius = inSize;

  float angle = 0;
  float angleStep = 180.0/nSides;

  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= nSides; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();
}

class MusicBeats {
  int shapes ;
  color c ;
  color ogc ;
  float xpos ;
  float ypos ;
  float shapew ;
  float shapeh ;
  float volume ;

  MusicBeats (int shap, color col, float vol, float xPos, float yPos) {
    shapes = shap ;
    c = col ;
    ogc = col ;
    xpos = xPos ;
    ypos = yPos ;
    volume = vol ;
  }

  void display() {
    strokeWeight(1) ;
    stroke(255) ;
    fill(c) ;

    if (shapes == 1) {
      rectPoly(xpos, ypos, shapew) ;
    } else if (shapes == 2) {
      ellipse (xpos, ypos, shapew, shapeh) ;
    } else if (shapes == 3) {
      star(xpos, ypos, (shapew/3)*1.25, (shapeh/2)*1.25) ;
    } else if (shapes == 4) {
      trig(xpos, ypos, shapew) ;
    }
  }

  void move(float svol) {
    volume = svol ;
    shapew = svol*187 ;
    shapeh = svol*200 ;
    xpos = random(width-(width/5)) ;
    ypos = random(height) ;
  }


  void hide() {
    noFill() ;
    noStroke() ;
  }

  void goback() {
    c = ogc ;
  }
}
