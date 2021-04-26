class Ground {

  color sand = color(254, 254, 227);
  float bottom=60;
  //800,600
  
  void drawGround() {
    noStroke();
    fill(sand);
    rect(0, height-bottom, width, bottom);
  }
  public float getBottom() {
    return bottom;
  }
}
