class Animation{
  ArrayList<PImage> kickFrames = new ArrayList<PImage>();
  ArrayList<PImage> runFrames = new ArrayList<PImage>();
  ArrayList<PImage> backStpFrames = new ArrayList<PImage>();
  ArrayList<PImage> idleFrames = new ArrayList<PImage>();
  ArrayList<PImage> rangedFrames = new ArrayList<PImage>();
  ArrayList<PImage> smashFrames = new ArrayList<PImage>();
  ArrayList<PImage> blockFrames = new ArrayList<PImage>();
  
  int counter;
  int nx; //x-position to start from spritesheet, defines frame
  int ny; //y-position to start from spritesheet, defines which animation to play
  int w = 1000; //sprite- width/height
  int x; //x-position to place sprite
  int y; //y-position to place sprite  
  int aniFrames1;
  int aniFrames2;
  String pAnimation = "idle";
  boolean pDoinIt = false;
  
  
  Fighter f;
  
  Animation(int posX, int posY, Fighter f ){
    y = posY;
    x = posX;
    this.f = f;
    sprite = loadImage("spritesheetncKICK.png");
  }



  void anidraw(){
    //For player 1
     
     x = round(f.location.x)-w/4;
     y = round(f.location.y)-w/3;
    if(pAnimation == "QuickAttack"){
      aniFrames1 = 16;
      pDoinIt = true;
      quickAttackAni();
    }
    if(pAnimation == "idle"){
      
    }
     //Post animation
    if(aniFrames1 < frameCount-counter){
      pDoinIt = false;
      pAnimation = "idle";
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
    ny=0*w;
    
    if(frameCount-counter<8)   nx=0*w;
    if(frameCount-counter==8)  nx=1*w;
    if(frameCount-counter==12)  nx=2*w;
    copy(sprite,nx,ny,w,w,x,y,w/2,w/2);    
  }
  
  void smash(){
    ny=2*w;
    if(frameCount-counter<8)   nx=1*w;
    if(frameCount-counter==8)  nx=2*w;
    if(frameCount-counter==16)  nx=3*w;
    if(frameCount-counter==24)  nx=0*w;
    copy(sprite,nx,ny,w,w,x,y,w,w);
  }
  
  void getAllFrames(){
    //kicks, 3 frames
    for(int i = 0; i<3; i++){
     kickFrames.add(loadImage("frames/KICKnocolour_0000"+i+".png"));
    }
  }
}
