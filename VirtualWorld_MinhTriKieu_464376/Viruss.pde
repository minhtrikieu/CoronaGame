
class Viruss {

  PImage virus[] = new PImage[2];
  PImage img1 = loadImage("VirussLevel1.png");
  PImage img2 = loadImage("VirussLevel2.png");
  float x;
  float y;
  float vy;
  float dimension;
  int typeOfViruss;
  float bottom;
  int speedOfViruss;

  boolean pass;

  public Viruss(int type) {

    virus[0] = loadImage("VirussLevel1.png");
    virus[1]= loadImage("VirussLevel2.png");

    this.typeOfViruss =type;
    x = int(random(width*0.7));
    y = random(0, 20);

    dimension = 40;
    vy = setSpeed(); 

    virus[0].resize(int(dimension), int(dimension));
    virus[1].resize(int(dimension+10), int(dimension+10));
  }

  public void setBottom(float bottom) {
    this.bottom = bottom;
  }

  int setSpeed() {
    switch(typeOfViruss) {
    case 0:
      speedOfViruss = 1;
      break;

    case 1:
      speedOfViruss = 2;
      x = 2*width/3;
      break;
    }
    return speedOfViruss;
  }

  void drawViruss() {
    image(virus[typeOfViruss], x, y);
    // println("Viruss Level 1 is activated");
  }

  void resetPosition() {
    y = virus[typeOfViruss].height/2;  
    x = int(random(virus[typeOfViruss].width/2, width - virus[typeOfViruss].width/2));
  }

  boolean moveViruss() {
    y += vy;
    if (y >= height + virus[typeOfViruss].height/2) {
      resetPosition();
      return true;
    } else {
      return false;
    }
  }

  boolean checkPass() {
    if (y >= height + virus[typeOfViruss].height/2) {
      return true;
    } else {
      return false;
    }
  }
}
