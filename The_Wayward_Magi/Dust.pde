class Dust{
  
  int x;
  int y;
  int d;
  
  int tX;
  int tY;
  
  int left;
  int right;
  int top;
  int bottom;
  
  Dust(int x0, int y0, int tX0, int tY0){
    
    x = x0;
    y = y0;
    d = 50;
    tX = tX0;
    tY = tY0;
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
    
  }
  
  void render(){
    //fill(255,255,0);
    //circle(x,y,d);
    dustA.isAnimating = true;
    dustA.display(x,y);
  }
  
  void collision(){
    
    if (p1.left0 < right &&
        p1.right0 > left &&
        p1.top < bottom &&
        p1.bottom > top){
          
          p1.x = tX;
          p1.y = tY;
          
        }
        
  }
  
}
