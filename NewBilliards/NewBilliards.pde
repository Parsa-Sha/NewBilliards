// BilliardsV4 
// Introduction to Fisica, using basic ball and box collisions

// Next time use mode framework to sort out different variables.
// Moral of the story: Please use mode framework. It's starting to hurt ;-;

// Next version:
//   Include scratch
//   Include teams according to ball pocketed
//   Include changing where you start
//   Include victory if 8 ball has been pocketed after all team's balls are pocketed
//   Include another turn if a person's ball has been pocketed
//   Improve Velocity & Fisics

import fisica.*;

FWorld world;

// Changing ArrayList into Array to keep indexes consistent
Ball[] myBalls;
Ball objectBall = null;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
final int GAMEOVER = 4;
int mode = INTRO;

int[] ballArrangement = new int[15];

boolean newGame = true;

PImage table;
PImage stick;
PImage[] ballImages = new PImage[16];
PImage bg;

PlayerBall pb = null;

void setup() {
  size(960, 540);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 0);
  frameRate(30);

  importImg();
  myBalls = new Ball[16];
}

void importImg() {
  table = loadImage("images\\EightBallTable.png");
  stick = loadImage("images\\poolStick.png");
  bg = loadImage("images\\introImage.png");
  ballImages[0] = loadImage("balls\\cueball.png");
  ballImages[1] = loadImage("balls\\1ball.png");
  ballImages[2] = loadImage("balls\\2ball.png");
  ballImages[3] = loadImage("balls\\3ball.png");
  ballImages[4] = loadImage("balls\\4ball.png");
  ballImages[5] = loadImage("balls\\5ball.png");
  ballImages[6] = loadImage("balls\\6ball.png");
  ballImages[7] = loadImage("balls\\7ball.png");
  ballImages[8] = loadImage("balls\\8ball.png");
  ballImages[9] = loadImage("balls\\9ball.png");
  ballImages[10] = loadImage("balls\\10ball.png");
  ballImages[11] = loadImage("balls\\11ball.png");
  ballImages[12] = loadImage("balls\\12ball.png");
  ballImages[13] = loadImage("balls\\13ball.png");
  ballImages[14] = loadImage("balls\\14ball.png");
  ballImages[15] = loadImage("balls\\15ball.png");
}

void draw() {
  switch (mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEWON:
    gamewon();
    break;
  case GAMEOVER:
    gameover();
    break;
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}
