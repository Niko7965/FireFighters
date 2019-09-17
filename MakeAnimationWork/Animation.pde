class Animation{
  int nx; //x-position to start from spritesheet, defines frame
  int ny; //y-position to start from spritesheet, defines which animation to play
  int w = 300; //sprite- width/height
  int x; //x-position to place sprite
  int y; //y-position to place sprite  
  
  Animation(int posX, int posY ){
    y = posY;
    x = posX;
  }

  void ranged(){
    ny=0*w;
    if(frameCount-counter<8)   nx=1*w;
    if(frameCount-counter==8)  nx=2*w;
    if(frameCount-counter==20)  nx=3*w;
    if(frameCount-counter==24)  nx=0*w;
    copy(sprite,nx,ny,w,w,x,y,w,w);
  }
  
  void quickAttack(){
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
