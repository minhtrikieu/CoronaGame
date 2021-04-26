class Mask extends PVector {

  PImage faceMask = loadImage("FaceMask.png");
  int heightOfMask; 
  int widthOfmask;

  PVector vel;

  public Mask(PVector loc, PVector vel) {

    super(loc.x, loc.y);
    this.vel = vel.get();

    heightOfMask =20; 
    widthOfmask =40;
    faceMask.resize(widthOfmask, heightOfMask);

  }
  void shootFaceMask() {
    image(faceMask, x, y);
  }
  void update() {
    add(vel);
  }
  boolean checkCollisionDoctor(Viruss viruss, int level) {
    boolean isCollision = false;
    isCollision = rectRect(x, y, faceMask.width, faceMask.height, 
      viruss.x, viruss.y, viruss.virus[level].width, viruss.virus[level].height);
    //noFill();
    //stroke(255, 0, 0);
    //rectMode(CORNER);
    //rect(x, y, faceMask.width, faceMask.height);
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
