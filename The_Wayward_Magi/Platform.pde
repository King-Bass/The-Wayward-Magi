class Platform{
  
  int x;
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  Platform(int x0,
  int y0){
    
    x = x0;
    y = y0;
    w = 150;
    h = 10;
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
  }
  
  void render(){
    fill(150,150,150);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
  void collide(Player aPlayer){
    if (left < aPlayer.right0 &&
        right > aPlayer.left0 &&
        top < aPlayer.bottom &&
        bottom > aPlayer.top &&
        p1.fall == true){
         
          p1.fall = false;
          p1.y = top - p1.s/2;
        }
  
        
  }
  
}
