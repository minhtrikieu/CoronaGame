import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

loadJson json;

Viruss viruss1[] = new Viruss[10];

ArrayList <Mask> mask = new ArrayList <Mask> ();

PImage endSplash = new PImage();
Ground ground1;

Doctor doctor1;

Lives lives;

int type =0;

int point =0;

boolean resume= true;
Minim minim;
AudioPlayer player;

int count =0;

PVector doctor, doctorSpeed;
float maxSpeed = 3;

void setup() {
  size(800, 600);

  // Check the temperature 
  // if the temperature is <5. Type 1 of Viruss is chosen
  // if the temperature is >=5. Type 0 of Viruss is chosen
  json = new loadJson();
  json.loadUrl();
  if ( json.returnTemp() >=5) {
    type =0;
  } else {
    type =1;
  }

  endSplash = loadImage("GameOver.png");
  endSplash.resize(width, height);

  ground1 = new Ground();

  for (int i =0; i < viruss1.length; i ++) {
    viruss1[i] =new Viruss(type);
    viruss1[i].setBottom(ground1.getBottom());
  }

  doctor1 = new Doctor();
  lives = new Lives();

  doctor1.setBottom(ground1.getBottom());


  minim = new Minim(this);
  player = minim.loadFile("FootStep.mp3");
}
void draw() {
  background(#b3b3ff);

  if (resume) {
    doctor1.drawDoctor();

    // get the position of character for a shot
    doctor = new PVector(int(doctor1.x), int(doctor1.y) );
    doctorSpeed = new PVector();

    // display the point after correct shoot
    displayPoint();

    // initialise the mouse to aim for a shot
    doctor.add(doctorSpeed);
    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 5, 5);

    lives.displayLives();
    ground1.drawGround();

    // Drop viruss from top.
    // Check collision with the doctor. If yes, -1 live.
    // If the viruss passes the ground, -1 live.
    for (Viruss v : viruss1) {
      v.drawViruss();
      
      if (v.moveViruss() == true) {
        lives.decreaseLives();
        v.resetPosition();
      }

      if (doctor1.checkCollisionDoctor(v, type) == true || v.checkPass() == true) {
        lives.decreaseLives();
        v.resetPosition();
      }
    }



    // Shoot mask. 
    // Check collision with the viruss. If yes, +1 point.
    for (Mask b : mask) {
      b.update();
      b.shootFaceMask();
      for (Viruss v : viruss1) {
        if ( b.checkCollisionDoctor(v, type)) {
          point ++;
          v.resetPosition();
        }
      }
    }

    // Add mask to the array after shooting
    if (frameCount%10==0 && mousePressed) {
      PVector dir = PVector.sub(mouse, doctor);
      dir.normalize();
      dir.mult(maxSpeed*2);
      Mask b = new Mask(doctor, dir);
      mask.add(b);
    }

    resume = lives.checkLive();
  } else {
    image(endSplash, 0, 0);
  }
}

void displayPoint() {
  textSize(20);
  text("Point: " + point, 685, 100);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      doctor1.moveUp();
      player.play();
      player.rewind();
    } else if (keyCode == DOWN) {
      doctor1.moveDown();
      player.play();
      player.rewind();
    } else if (keyCode == LEFT) {
      doctor1.moveLeft();
      player.play();
      player.rewind();
    } else if (keyCode == RIGHT) {
      doctor1.moveRight();
      player.play();
      player.rewind();
    }
  }
};
