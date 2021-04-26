class Lives {

  int livesLeft =3;
  PImage heart = loadImage("Heart.png");
  int dimension =30;
  int xCor =685;
  int yCor =30;

  void decreaseLives() {
    livesLeft -=1;
  }
  
  void displayLives(){
    if( livesLeft ==3){
      image(heart,xCor,yCor,dimension,dimension);
      image(heart,xCor+40,yCor,dimension,dimension);
      image(heart,xCor+80,yCor,dimension,dimension);
    }
    else if( livesLeft ==2){
      image(heart,xCor,yCor,dimension,dimension);
      image(heart,xCor+40,yCor,dimension,dimension);
    }
    else if( livesLeft ==1){
      image(heart,xCor,yCor,dimension,dimension);
    }
  }
  
  boolean checkLive() {
    if (livesLeft ==0) {
      return false;
    } else {
      return true;
    }
  }
  int getLives() {
    return livesLeft;
  }
}
