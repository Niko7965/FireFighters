class Animation{
  int nx; //x-position to start from spritesheet, defines frame
  int ny; //y-position to start from spritesheet, defines which animation to play
  int w = 300; //sprite- width/height
  int x; //x-position to place sprite
  int y; //y-position to place sprite  
  int aniFrames;
  String p1Animation = "idle";
  String p2Animation = "idle";
  boolean p1DoinIt = false;
  boolean p2DoinIt = false;
  
  Animation(int posX, int posY ){
    y = posY;
    x = posX;
  }



  void anidraw(){
    //For player 1
     
     x = round(player1.location.x);
     y = round(player1.location.y);
    if(p1Animation == "QuickAttack"){
      p1DoinIt = true;
      quickAttackAni();
    }
    if(p1Animation == "idle"){
      
    }
     //Post animation
    if(aniFrames < frameCount-counter){
      p1DoinIt = false;
      p1Animation = "idle";
      }
    
    
  
  }
  void ranged(){
    ny=0*w;
    if(frameCount-counter<8)   nx=1*w;
    if(frameCount-counter==8)  nx=2*w;
    if(frameCount-counter==20)  nx=3*w;
    if(frameCount-counter==24)  nx=0*w;
    copy(sprite,nx,ny,w,w,x,y,w,w);
  }
  
  void quickAttackAni(){ 
    //PreAnimation
    aniFrames = 24;
     
    ny=1*w;
    if(frameCount-counter<8)   nx=1*w;
    if(frameCount-counter==8)  nx=2*w;
    if(frameCount-counter==16)  nx=3*w;
    if(frameCount-counter==24)  nx=0*w;
    copy(sprite,nx,ny,w,w,x,y,w,w);
    
    
    
   
    
  }
  
  void smash(){
    ny=2*w;
    if(frameCount-counter<8)   nx=1*w;
    if(frameCount-counter==8)  nx=2*w;
    if(frameCount-counter==16)  nx=3*w;
    if(frameCount-counter==24)  nx=0*w;
    copy(sprite,nx,ny,w,w,x,y,w,w);
  }
  
}
