// The Wayward Magi
// By: J.T. Wilmot

// Some code is from the DA_Intereacting_Objects assignment
import processing.sound.*;

PImage[] magi = new PImage[2];
PImage[] dust = new PImage[2];
PImage[] goal = new PImage[6];
PImage funny2;


Animation magiA;
Animation dustA;
Animation goalA;

Player p1;

Platform plat1;
Platform plat2;
Platform plat3;
Platform plat4;
Platform plat5;
Platform plat6;
Platform plat7;
Platform plat8;
Platform plat9;
Platform plat10;
Platform plat11;

Dust d1;
Dust d2;
Dust d3;
Dust d4;

Goal g1;

SoundFile jump;
SoundFile song;
SoundFile funny;

int state = 0;
boolean canAdd = false;

boolean showTutorial = false;

ArrayList<Platform> platformList;
void setup() {
  size(800, 600);
  rectMode(CENTER);
  jump = new SoundFile(this, "jump.wav");
  song = new SoundFile(this, "song.mp3");
  funny = new SoundFile(this, "funny.mp3");
  p1 = new Player(width/2, height/2, 50);
  plat1 = new Platform(width/2, height - height/4);
  plat2 = new Platform(width/4, height/2);
  plat3 = new Platform(width - 150/2, height/6);
  d1 = new Dust(width/4, height/2 - 35, width - 120, height/8 - 50);
  g1 = new Goal(width - 150/2, height/6 - 60);
  plat4 = new Platform(75, height - height/4);
  plat5 = new Platform(75, height/4);
  plat6 = new Platform(width - 150/2, height/6);
  plat7 = new Platform(width/2, height/6);
  d2 = new Dust(width/2, height/2, 75, 10);
  plat8 = new Platform(75, height/4);
  plat9 = new Platform(75, height/2);
  plat10 = new Platform(width - 75, height/2);
  plat11 = new Platform(width - 75, height/4 - 40);
  d3 = new Dust(55, height - 30, 30, height/2 - 30);
  d4 = new Dust(width/2 + 50, height/20, width - 50, height/2 - 40);
  for (int index=0; index<magi.length; index++){
    
    magi[index] = loadImage("magi" + index + ".png");
    
  }
  
  magiA = new Animation(magi, .025, 1.5);
  
  for (int index=0; index<dust.length; index++){
    
    dust[index] = loadImage("dust" + index + ".png");
    
  }
  
  dustA = new Animation(dust, .025, 5.0);
  
  for (int index=0; index<goal.length; index++){
    
    goal[index] = loadImage("goal" + index + ".png");
    
  }
  
  goalA = new Animation(goal, .05, 1.5);
  
  funny2 = loadImage("funny2.jpeg");
  
  platformList = new ArrayList<Platform>();

  platformList.add(plat1);
  platformList.add(plat2);
  platformList.add(plat3);
}

void draw() {
  background(150, 150, 255);
  gameEngine();
}

void playerStuff() {
  p1.render();
  p1.move();
  p1.jump();
  p1.fall();
  p1.top();
  p1.bottom();
  p1.fallPlat(platformList);
  p1.walls();
}

void keyPressed() {
  if (key == 'a') {
    p1.left = true;
    showTutorial = false;
  }

  if (key == 'd') {
    p1.right = true;
    showTutorial = false;
  }

  if (key == 'w' && p1.jump == false && p1.fall == false) {
    p1.jump = true;
    p1.jT = p1.y - p1.jH;
    if (jump.isPlaying() == false){
    jump.play();
    }
        showTutorial = false;

  }

  if (key == 'p') {
    state = 1;
    showTutorial = true;
  }

  if (key == 'n' && canAdd == true) {
    state += 1;
    p1.x = width/2;
    p1.y = height - 25;

    if (state == 2) {
      platformList.remove(plat1);
      platformList.remove(plat2);
      platformList.remove(plat3);
      platformList.add(plat4);
      platformList.add(plat5);
      platformList.add(plat6);
      platformList.add(plat7);
    }

    if (state == 3) {
      platformList.remove(plat4);
      platformList.remove(plat5);
      platformList.remove(plat6);
      platformList.remove(plat7);
      platformList.add(plat8);
      platformList.add(plat9);
      platformList.add(plat10);
      platformList.add(plat11);
    }
  }

  if (key == '+') {
    state = 0;
  }
}

void keyReleased() {
  if (key == 'a') {
    p1.left = false;
  }

  if (key == 'd') {
    p1.right = false;
  }
}

void platformStuff() {

  for (Platform aPlatform : platformList) {
    println(aPlatform);
    aPlatform.render();
    aPlatform.collide(p1);
  }
}

void dustStuff() {

  if (state == 1) {
    d1.render();
    d1.collision();
  }

  if (state == 2) {
    d2.render();
    d2.collision();
  }

  if (state == 3) {
    d3.render();
    d3.collision();
    d4.render();
    d4.collision();
  }
}

void goalStuff() {
  g1.render();
  g1.collision();
}

void game() {
  playerStuff();
  platformStuff();
  dustStuff();
  goalStuff();
  songStuff();
}

void gameEngine() {

  switch (state) {

  case 0:
  songStuff();
    startScreen();
    break;

  case 1:
  tutorialStuff();
    game();
    break;

  case 2:
  funny2();
    game();
    break;

  case 3:
    game();
    break;
    
  case 4:
  songStuff();
    endScreen();
    break;
    
  case 5:
  endScreen();
  funny();
  }
  
  
}

void startScreen(){
  fill(0,100,0);
  stroke(0,100,0);
  rect(width/2,height - height/8,width,200);
  circle(width/4,height - height/4, 200);
  stroke(0,0,0);
  fill(200,100,200);
  textAlign(CENTER);
  textSize(100);
  text("The Wayward Magi", width/2, height/4);
  text("Press p to start...", width/2, height/2);
  textSize(50);
  text("Good luck, magi!", width/2, height - 100);
  
  
}

void endScreen(){
  fill(0,100,0);
  stroke(0,100,0);
  rect(width/2,height - height/8,width,200);
  circle(width - width/3,height - height/4, 475);
  stroke(0,0,0);
  fill(200,100,200);
  textAlign(CENTER);
  textSize(50);
  text("You've made it home, magi!", width/2, height/8);
  text("Don't stray again, please...", width/2, height/4);
  magiA.display(width/2,height - height/10);
}

void songStuff(){
  if (song.isPlaying() == false){
  song.play();
  }
}

void tutorialStuff(){
  
  if (showTutorial == true){
    fill(200,100,200);
  textAlign(CENTER);
  textSize(25);
  text("W to jump. A and D to move.", width/2, height/8);
  text("Dust teleports you. The portal is the goal.", width/2, height/4);
  }
}

void funny(){
  if (funny.isPlaying() == false){
  funny.play();
  }
}

void funny2(){
  if (state == 2 && p1.x > width - 30 && p1.x < width && p1.y < 100){
    background(0,0,0);
    image(funny2, width/2, height/2);
  }
}
