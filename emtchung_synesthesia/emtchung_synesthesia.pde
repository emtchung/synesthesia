
import processing.sound.* ;
import controlP5.* ;

ControlP5 cp5 ;
Amplitude mamp ;
AudioIn mic ;
SoundFile file ;
Amplitude samp ;
Mic mibeats ;
MusicBeats mbeats ;

ArrayList<MusicBeats> mubeats = new ArrayList<MusicBeats>() ;

boolean show = false ;
boolean tooloud = false ;

float maxLevel = 0.98 ;
float maxHLevel = 0.85 ;
float minHLevel = 0.73 ;
float maxM2Level = 0.6 ;
float minM2Level = 0.5 ;
float maxM1Level = 0.41 ;
float minM1Level = 0.31 ;
float maxLLevel = 0.25 ;
float minLLevel = 0.13 ;

color maxCol ;
color mHcol ;
color mLcol ;

color maxsCol ;
color sHcol ;
color sMcol ;
color sLcol ;

color mcol = color(0, 0, 0, 255) ;
color scol = color(0, 0, 0, 255) ;

int mschosen = 2 ;
int sschosen = 1 ;

int loopcount ;
int loudcount ;

int m = 1 ;

void setup() {
  size(1000, 800);
  background (0);
  frameRate (8);
  smooth() ;

  mic = new AudioIn(this, 0) ;
  mamp = new Amplitude(this) ;
  mamp.input(mic) ;
  mic.stop() ;

  float micxpos = random(10, width-(width/5)-10) ;
  float micypos = random(10, height-10) ;

  float mvol = mamp.analyze() ;
  float mvolsize = map(mvol, 0, 1, 0, 1) ;

  int dir = int(random(0, 8)) ;
  mibeats = new Mic(mschosen, mcol, mvolsize, micxpos, micypos, dir) ;

  file = new SoundFile(this, "JackElphick.wav") ;

  samp = new Amplitude(this);
  samp.input(file) ;

  //buttons
  cp5 = new ControlP5(this) ;

  cp5.addButton("play")
    .setPosition(845, 370)
    .setColorBackground(#0A0A0A)
    .setColorForeground(#818181)
    .setSize(50, 25)
    ;

  cp5.addButton("stop")
    .setPosition(905, 370)
    .setColorBackground(#FFFFFF)
    .setColorForeground(#818181)
    .setColorCaptionLabel(0)
    .setSize(50, 25)
    ;

  cp5.addButton("clearscreen")
    .setPosition(910, 760)
    .setSize(70, 25)
    ;

  cp5.addButton("screenshot")
    .setPosition(910, 730)
    .setSize(70, 25)
    ;

  cp5.addButton("off")
    .setPosition(821, 760)
    .setSize(70, 25)
    ;

  cp5.addButton("on")
    .setPosition(821, 730)
    .setSize(70, 25)
    ;

   cp5.addButton("unmute")
    .setPosition(845, 655)
    .setSize(50, 25) 
    .setColorBackground(#FFFFFF)
    .setColorForeground(#818181) 
    .setColorCaptionLabel(0) 
  ;

  cp5.addButton("mute")
    .setPosition(905, 655)
    .setSize(50, 25) 
    .setColorBackground(#0A0A0A)
    .setColorForeground(#818181) 
  ;

  //songs
  cp5.addButton("two")
    .setPosition(865, 70)
    .setSize((width/10) - 65, 25)
    ;

  cp5.addButton("three")
    .setPosition(905, 70)
    .setSize((width/10) - 65, 25)
    ;

  cp5.addButton("six")
    .setPosition(865, 100)
    .setSize((width/10) - 65, 25)
    ;

  cp5.addButton("seven")
    .setPosition(905, 100)
    .setSize((width/10) - 65, 25)
    ;

  cp5.addButton("ten")
    .setPosition(865, 130)
    .setSize((width/10) - 65, 25)
    ;

  cp5.addButton("eleven")
    .setPosition(905, 130)
    .setSize((width/10) - 65, 25)
    ;
    
   cp5.addButton("four")
    .setPosition(945, 70)
    .setSize((width/10) - 65, 25)
    ;
 
   cp5.addButton("five")
    .setPosition(825, 100)
    .setSize((width/10) - 65, 25)
    ;
    
   cp5.addButton("nine")
    .setPosition(825, 130)
    .setSize((width/10) - 65, 25)
    ;
    
   cp5.addButton("one")
    .setPosition(825, 70)
    .setSize((width/10) - 65, 25)
    ;
 
   cp5.addButton("eight")
    .setPosition(945, 100)
    .setSize((width/10) - 65, 25)
    ;
 
   cp5.addButton("twelve")
    .setPosition(945, 130)
    .setSize((width/10) - 65, 25)
    ;
 
  //Songcolors

  cp5.addButton("S_purple")
    .setPosition(827, 190)
    .setSize(45, 25)
    .setColorForeground(#4D1F7C)
    .setColorBackground(#8F21FE)
    ;

  cp5.addButton("S_orange")
    .setPosition(927, 190)
    .setSize(45, 25)
    .setColorForeground(#A7571D)
    .setColorBackground(#E67F32)
    ;

  cp5.addButton("S_blue")
    .setPosition(827, 220)
    .setSize(45, 25)
    .setColorLabel(0)
    .setColorForeground(#0F77A5)
    .setColorBackground(#39BFFF)
    ;

  cp5.addButton("S_yellow")
    .setPosition(927, 220)
    .setSize(45, 25)
    .setColorLabel(0)
    .setColorForeground(#D6C102)
    .setColorBackground(#FFEC2F)
    ;
    
    cp5.addButton("S_green")
    .setPosition(877, 220)
    .setSize(45, 25)
    .setColorLabel(0)
    .setColorBackground(#1CFF00)
    .setColorForeground(#119800)
  ;

    cp5.addButton("S_red")
    .setPosition(877, 190)
    .setSize(45, 25)
    .setColorLabel(0)
    .setColorBackground(#FA1200) 
    .setColorForeground (#A50B00)
  ;

  //shapes songs
  cp5.addButton("s_diam")
    .setPosition(850, 280)
    .setSize(45, 25) ;
  ;

  cp5.addButton("s_ellip")
    .setPosition(905, 280)
    .setSize(45, 25)
    ;

  cp5.addButton("s_trig")
    .setPosition(850, 310)
    .setSize(45, 25)
    ;

  cp5.addButton("s_star")
    .setPosition(905, 310)
    .setSize(45, 25)
    ;

  //Miccolors

  cp5.addButton("m_purple")
    .setPosition(820, 475)
    .setSize(50, 25)
    .setColorForeground(#4D1F7C)
    .setColorBackground(#8F21FE)
    ;

  cp5.addButton("m_orange")
    .setPosition(929, 475)
    .setSize(50, 25)
    .setColorForeground(#A7571D)
    .setColorBackground(#E67F32)
    ;

  cp5.addButton("m_blue")
    .setPosition(820, 505)
    .setSize(50, 25)
    .setColorLabel(0)
    .setColorForeground(#0F77A5)
    .setColorBackground(#39BFFF)
    ;

  cp5.addButton("m_yellow")
    .setPosition(929, 505)
    .setSize(50, 25)
    .setColorLabel(0)
    .setColorForeground(#D6C102)
    .setColorBackground(#FFEC2F)
    ;
    
    cp5.addButton("m_green")
    .setPosition(875, 505)
    .setSize(50, 25)
    .setColorLabel(0)
    .setColorBackground(#1CFF00) 
    .setColorForeground(#119800);
  ;
  
    cp5.addButton("m_red")
    .setPosition(875, 475)
    .setSize(50, 25)
    .setColorLabel(0)
    .setColorBackground(#FA1200) 
    .setColorForeground(#A50B00);
  ;

  //shapes mic
  cp5.addButton("m_diam")
    .setPosition(850, 565)
    .setSize(45, 25)
    ;

  cp5.addButton("m_ellip")
    .setPosition(905, 565)
    .setSize(45, 25)
    ;

  cp5.addButton("m_trig")
    .setPosition(850, 595)
    .setSize(45, 25)
    ;

  cp5.addButton("m_star")
    .setPosition(905, 595)
    .setSize(45, 25)
    ;
}

void draw() {

  float mvol = mamp.analyze() ;
  float mvolsize = map(mvol, 0, 1, 0, 1) ;
  mibeats.volume = mvolsize ;

  if (loopcount%10 == 0) {
    int direct = int(random(0, 8)) ;
    mibeats.direction = direct ;
  }
  
  if (mvol > 0.48 && !tooloud) {
    mibeats.shapes = mschosen ;
    mibeats.c = maxCol ;
    mibeats.move(m) ;
    mibeats.display() ;
    tooloud = true ;
  } else if (mvol > 0.25) {
    mibeats.shapes = mschosen ;
    mibeats.c = maxCol ;
    mibeats.move(m) ;
    mibeats.display() ;
  } else if (mvol > 0.1) {
    mibeats.shapes = mschosen ;
    mibeats.c = mHcol ;
    mibeats.move(m) ;
    mibeats.display() ;
  } else if (mvol > 0.06) {
    mibeats.shapes = mschosen ;
    mibeats.c = mcol ;
    mibeats.move(m) ;
    mibeats.display() ;
  } else if (mvol > 0.03) {
    mibeats.shapes = mschosen ;
    mibeats.c = mLcol ;
    mibeats.move(m) ;
    mibeats.display() ;
  }


  float songvol = samp.analyze() ;
  float svol = map(songvol, 0, 1, 0, 1) ;
  float songxpos = random(width-(width/5)) ;
  float songypos = random(height) ;

  if (show == true) {
    mbeats = new MusicBeats(sschosen, scol, svol, songxpos, songypos) ;
    mubeats.add(mbeats) ;
    if (svol > maxLevel) {
      mbeats.c = maxsCol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    } else if (svol > minHLevel && svol < maxHLevel) {
      mbeats.c = sHcol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    } else if (svol > minM2Level && svol < maxM2Level) {
      mbeats.c = scol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    } else if (svol > minM1Level && svol < maxM1Level) {
      mbeats.c = sMcol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    } else if (svol > minLLevel && svol < maxLLevel) {
      mbeats.c = sLcol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    } else if (svol > 0.05 && svol < minLLevel) {
      mbeats.c = sLcol ;
      mbeats.move(svol) ;
      mbeats.display() ;
    }
  }

  if (tooloud == true) {
    for (int i = 0; i < mubeats.size(); i+=1) {
      MusicBeats beat = mubeats.get(i);
      beat.c = color(random(255), random(255), random(255)) ;
      beat.display() ;
    }

    loudcount+=1 ;
    if (loudcount % 16 == 0) {
      tooloud = false ;
      for (int i = 0; i < mubeats.size(); i+=1) {
        MusicBeats beat = mubeats.get(i);
        beat.goback() ;
        beat.display() ;
      }
    }
  } else {
    loudcount = 0;
  }

  rectMode(CORNER) ;
  strokeWeight(1) ;
  stroke(255);
  fill(#40475D) ;
  rect(width-(width/5), 0, (width/5), height) ;

  //key text
  fill (255);
  textSize (23);
  text ("SONGS KEY", 845, 37);
  text ("MIC KEY", 860, 442);
  text ("OTHER", 910, 722);
  text ("MOUSE", 820, 722);

  textSize (15);
  text ("SONG CHOICE", 857, 62);
  text ("SONG COLOR", 858, 182);
  text ("SONG SHAPE", 858, 272);
  text ("SONG FUNCTIONS", 843, 365);
  text ("MIC COLOR", 864, 467);
  text ("MIC SHAPE", 863, 557);
  text ("MIC FUNCTIONS", 848, 647);


  loopcount += 1 ;
}

void play() {
  file.stop() ;
  file.play() ;
  show = true ;
}

void stop() {
  file.stop() ;
  show = false ;
}

void two() {
  file.stop() ;
  file = new SoundFile(this, "AnnaLandstrom.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void three() {
  file.stop() ;
  file = new SoundFile(this, "GerhardFeng.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void six() {
  file.stop() ;
  file = new SoundFile(this, "IsaacLarson.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void seven() {
  file.stop() ;
  file = new SoundFile(this, "JackElphick.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void eleven() {
  file.stop() ;
  file = new SoundFile(this, "JackieMartin.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void ten() {
  file.stop() ;
  file = new SoundFile(this, "JawSquare.wav") ;
  file.amp(0.75) ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void four() {
  file.stop() ;
  file = new SoundFile(this,  "JFGloss.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void five() {
  file.stop() ;
  file = new SoundFile(this, "KatoriWalker.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void nine() {
  file.stop() ;
  file = new SoundFile(this, "KickCastle.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void one() {
  file.stop() ;
  file = new SoundFile(this, "OveMeyers.wav") ;
  file.amp(1) ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void eight() {
  file.stop() ;
  file = new SoundFile(this, "SightofWonders.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void twelve () {
  file.stop() ;
  file = new SoundFile(this, "WaterMirrors.wav") ;
  samp = new Amplitude(this);
  samp.input(file) ;
}

void S_purple() {
  maxsCol = color(126, 0, 255, 200) ;
  sHcol = color(152, 62, 245, 200) ;
  scol = color(125, 42, 209, 200) ;
  sMcol = color(91, 24, 160, 200) ;
  sLcol = color(67, 7, 129, 200) ;
}

void S_blue() {
  maxsCol = color(167, 228, 255, 230) ;
  sHcol = color(118, 213, 255, 200) ;
  scol = color(82, 200, 255, 150) ;
  sMcol = color(44, 190, 255, 100) ;
  sLcol = color(0, 176, 255, 75) ;
}

void S_orange() {
  maxsCol = color(255, 107, 0, 200) ;
  sHcol = color(232, 115, 30, 200) ;
  scol = color(191, 105, 45, 200) ;
  sMcol = color(152, 78, 25, 200) ;
  sLcol = color(129, 55, 3, 200) ;
}

void S_yellow() {
  maxsCol = color(255, 230, 0, 200) ;
  sHcol = color(240, 219, 24, 200) ;
  scol = color(214, 197, 43, 200) ;
  sMcol = color(173, 158, 28, 200) ;
  sLcol = color(124, 112, 6, 200) ;
}

void s_diam() {
  sschosen = 1 ;
}

void s_star() {
  sschosen = 3 ;
}

void s_trig() {
  sschosen = 4 ;
}

void s_ellip() {
  sschosen = 2 ;
}

void clearscreen() {
  background(0) ;
  mibeats.xpos = random(10, width-(width/5)-10) ;
  mibeats.ypos = random(10, height-10) ;
  for (int i = 0; i < mubeats.size(); i+=1) {
    MusicBeats beat = mubeats.get(i);
    beat.xpos = -500 ;
    beat.ypos = -500 ;
  }
}

void mute() {
  mic.stop() ;
}

void unmute() {
  mic = new AudioIn(this, 0) ;
  mamp = new Amplitude(this) ;
  mamp.input(mic) ;
  mic.start() ;
  mibeats.xpos = random(10, width-(width/5)-10) ;
  mibeats.ypos = random(10, height-10) ;
}

void m_purple() {
  maxCol = color(213, 173, 255) ;
  mHcol = color(173, 93, 255) ;
  mcol = color(126, 0, 255) ;
  mLcol = color(93, 0, 188) ;
}

void m_blue() {
  maxCol = color(170, 229, 255) ;
  mHcol = color(88, 203, 255) ;
  mcol = color(0, 176, 255) ;
  mLcol = color(2, 132, 191) ;
}

void m_orange() {
  maxCol = color(255, 207, 173) ;
  mHcol = color(255, 155, 82) ;
  mcol = color(255, 107, 0) ;
  mLcol = color(193, 82, 2) ;
}

void m_yellow() {
  maxCol = color(255, 246, 163) ;
  mHcol = color(255, 237, 75) ;
  mcol = color(255, 230, 0) ;
  mLcol = color(196, 177, 0) ;
}

void m_diam() {
  mschosen = 1 ;
}

void m_star() {
  mschosen = 3 ;
}

void m_trig() {
  mschosen = 4 ;
}

void m_ellip() {
  mschosen = 2 ;
}

void screenshot() {
  saveFrame() ;
}

void m_red() {
  maxCol = color(255, 111, 95);
  mHcol = color(255, 28, 3) ;
  mcol = color(222, 22, 0) ;
  mLcol = color(162, 16, 0) ;
}

void m_green() {
  maxCol = color(125, 255, 108) ;
  mHcol = color(56, 255, 31) ;
  mcol = color(26, 237, 0) ;
  mLcol = color(23, 191, 2) ;
}

void S_red() {
  maxsCol = color(255, 130,116, 200) ;
  sHcol = color(240, 92, 75, 200) ;
  scol = color(211, 65, 49, 200) ;
  sMcol = color(185, 39, 22, 200) ;
  sLcol = color(162, 16, 0, 200) ;
}

void S_green() {
  maxsCol = color(120, 155, 103, 200) ;
  sHcol = color(88, 237, 69, 200) ;
  scol = color(56, 222, 36, 200) ;
  sMcol = color(40, 193, 18, 200) ;
  sLcol = color(21, 167, 0, 200) ;
}

void on() {
  m = 0 ;
}

void off() {
  m = 1 ; 
}
