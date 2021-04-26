import ddf.minim.*;

class Doctor {
  
  PImage doctorCharacter = loadImage("Doctor.png");
  int heightOfDoctor; 
  int widthOfDoctor;
 
  
  public float bottom;
  float x; 
  float y;
  float vx;
  float vy;

  public void setBottom(float bottom) {
    this.bottom = bottom;
  }

  public Doctor() {
    vx =10;
    vy =10;

    heightOfDoctor = 130; 
    widthOfDoctor = 100; 
    doctorCharacter.resize(widthOfDoctor, heightOfDoctor);

    x = width/2; 
    //y = height - bottom - heightOfDoctor ; 
    y= 415;
  }


  void drawDoctor() {
    image(doctorCharacter, x, y, widthOfDoctor, heightOfDoctor);
  }

  void moveUp() {
    y -=vy;
  }
  void moveDown() {
    if (y <410) {
      y +=vy;
    }
  }
  void moveRight() {
    x +=vx;
  }
  void moveLeft() {
    x -=vx;
  }
  boolean checkCollisionDoctor(Viruss viruss, int level) {
    boolean isCollision = false;
    isCollision = rectRect(x, y, doctorCharacter.width, doctorCharacter.height, 
      viruss.x, viruss.y, viruss.virus[level].width, viruss.virus[level].height);
    //noFill();
    //stroke(255, 0, 0);
    //rectMode(CORNER);
    //rect(x, y, doctorCharacter.width, doctorCharacter.height);
    //rect(viruss.x, viruss.y, viruss.img1.width, viruss.img1.height);

    return isCollision;
  }
  
 
  
  // RECTANGLE/RECTANGLE
  boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {

    // are the sides of one rectangle touching the other?

    if (r1x + r1w >= r2x &&    // r1 right edge past r2 left
      r1x <= r2x + r2w &&    // r1 left edge past r2 right
      r1y + r1h >= r2y &&    // r1 top edge past r2 bottom
      r1y <= r2y + r2h) {    // r1 bottom edge past r2 top
      return true;
    }
    return false;
  }
}
