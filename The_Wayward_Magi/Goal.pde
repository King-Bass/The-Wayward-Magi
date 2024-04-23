class Goal{
  
  int x;
  int y;
  int s;
  int w;
  int h;
  int x2;
  int y2;
  
  int left;
  int right;
  int top;
  int bottom;
  
  String endWord;
  String a = "advance!";
  String b = "end your journey!";
  
  Goal(int x0, int y0){
    
    x = x0;
    y = y0;
    w = 200;
    h = 50;
    s = 50;
    x2 = width/2;
    y2 = height/2;
    left = x - s/2;
    right = x + s/2;
    top = y - s/2;
    bottom = y + s/2;
    
  }
  
  void render(){
    //fill(0,255,0);
    //square(x,y,s);
    goalA.isAnimating = true;
    goalA.display(x,y);
  }
  
  void collision(){
    
    if (state <= 2){
      endWord = a;
    }
    
    else{
      endWord = b;
    }
    
    if (p1.left0 < right &&
        p1.right0 > left &&
        p1.top < bottom &&
        p1.bottom > top){
          fill(50,255,50);
          textAlign(CENTER);
          textSize(50);
          text("Goal reached!",x2,y2);
          text("Press n to " + endWord,x2, y2 + 75);
          canAdd = true;
        }
        else{
          canAdd = false;
        }
  }
  
}
