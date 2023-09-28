class Mic {
  int shapes ;
  color c ;
  float xpos ;
  float ypos ;
  float xspeed ;
  float yspeed ;
  float shapew ;
  float shapeh ;
  float volume ;
  int direction ;
  boolean switchc ;

  Mic (int shap, color col, float vol, float xPos, float yPos, int dir) {
    shapes = shap ;
    c = col ;
    volume = vol ;
    xpos = xPos ;
    ypos = yPos ;
    xspeed = 25 ;
    yspeed = 25 ;
    shapew = volume ;
    shapeh = volume ;
    direction = dir ;
    switchc = false ;
  }

  void display() {
    stroke(c) ;
    strokeWeight(1.75) ;
    noFill() ;
    rectMode(CENTER) ;

    shapew = volume * 500 ;
    shapeh = volume * 500 ;

    if (shapes == 1) {
      rectPoly(xpos, ypos, shapew) ;
    } else if (shapes == 2) {
      ellipse (xpos, ypos, shapew, shapeh) ;
    } else if (shapes == 3) {
      star(xpos, ypos, shapew/3, shapeh/2) ;
    } else if (shapes == 4) {
      trig(xpos, ypos, shapew) ;
    }
  }

  //edit these parameters
  void move(int x) {
    float x2 = random(10, (width-(width/5))) ;
    float y2 = random(10, (height - 10)) ;
    if (x == 1) {
      if (direction == 1) {
        xpos += xspeed ;
        if (xpos > ((width-(width/5)) - (10+shapew)) || xpos < (10+shapew)) {
          xspeed *= -1 ;
        }
      } else if (direction == 2) {
        ypos += yspeed ;
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      } else if (direction == 3) {
        xpos -= xspeed ;
        if (xpos > ((width-(width/5)) - (20+shapew)) || xpos < (20+shapew)) {
          xspeed *= -1 ;
        }
      } else if (direction == 4) {
        ypos -= yspeed ;
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      } else if (direction == 5) {
        xpos += xspeed ;
        ypos += yspeed ;
        if (xpos > ((width-(width/5)) - (10+shapew)) || xpos < (10+shapew)) {
          xspeed *= -1 ;
        }
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      } else if (direction == 6) {
        xpos -= xspeed ;
        ypos += yspeed ;
        if (xpos > ((width-(width/5)) - (10+shapew)) || xpos < (10+shapew)) {
          xspeed *= -1 ;
        }
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      } else if (direction == 7) {
        xpos += xspeed ;
        ypos -= yspeed ;
        if (xpos > ((width-(width/5)) - (10+shapew)) || xpos < (10+shapew)) {
          xspeed *= -1 ;
        }
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      } else if (direction == 0) {
        xpos -= xspeed ;
        ypos -= yspeed ;
        if (xpos > ((width-(width/5)) - (10+shapew)) || xpos < (10+shapew)) {
          xspeed *= -1 ;
        }
        if (ypos > (height - (10+shapeh)) || ypos < (10+shapeh)) {
          yspeed *= -1 ;
        }
      }
    } else if (x == 0 ) {
      if (mouseX < (width-(width/5))) {
        xpos = mouseX ;
        ypos = mouseY ;
      } else {
        xpos = x2 ;
        ypos = y2 ;
      }
    }
  }
}
