class Player {

  int x;
  int y;
  
  int jH;
  int jT;

  int s;

  int speed;

  int left0;
  int right0;
  int top;
  int bottom;

  boolean left;
  boolean right;

  boolean jump;
  boolean fall;

  Player(int startingX,
    int startingY, int startingS) {

    x = startingX;
    y = startingY;

    jH = 200;
    jT = y - jH;

    s = startingS;

    left0 = x - s/2;
    right0 = x + s/2;
    top = y + s/2;
    bottom = y - s/2;

    speed = 10;
    left = false;
    right = false;
    jump = false;
    fall = false;
  }

  void render() {
    //fill(0,0,255);
    //square(x, y, s);
    magiA.isAnimating = true;
    magiA.display(x,y - 12);
  }

  void move() {
    left0 = x - s/2;
    right0 = x + s/2;
    top = y + s/2;
    bottom = y - s/2;
    if (left == true) {
      x -= speed;
    }

    if (right == true) {
      x += speed;
    }
  }

  void jump() {

    left0 = x - s/2;
    right0 = x + s/2;
    top = y - s/2;
    bottom = y + s/2;

    if (jump == true) {
      y -= speed;
    }
  }

  void fall() {
    if (fall == true) {
      y += speed;
    }
  }

  void top() {
    if (y < jT && jump == true) {
      jump = false;
      fall = true;
    }
  }

  void bottom() {
    if (y + s/2 >= height) {
      jump = false;
      fall = false;
    }
  }

  void fallPlat(ArrayList<Platform> aPlatList) {

    if (jump == false && y < height - s/2) {

      boolean onPlat = false;

      for (Platform aPlat : aPlatList) {
        if (top <= aPlat.bottom &&
          bottom >= aPlat.top &&
          left0 <= aPlat.right &&
          right0 >= aPlat.left) {
          onPlat = true;
          
        }
      }
      if (onPlat == false) {
        fall = true;
      }
    }
  }
  
  void walls(){
    
    if (x >= width){
      x = width - 20;
    }
    
    if (x <= 0){
      x = 20;
    }
  }
}
