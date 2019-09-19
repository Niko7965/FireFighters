class Animation{
  ArrayList<PImage> kickFrames = new ArrayList<PImage>();
  ArrayList<PImage> runFrames = new ArrayList<PImage>();
  ArrayList<PImage> backStpFrames = new ArrayList<PImage>();
  ArrayList<PImage> idleFrames = new ArrayList<PImage>();
  ArrayList<PImage> rangedFrames = new ArrayList<PImage>();
  ArrayList<PImage> smashFrames = new ArrayList<PImage>();
  ArrayList<PImage> blockFrames = new ArrayList<PImage>();
  
  int counter=0;
  int nx; //x-position to start from spritesheet, defines frame
  int ny; //y-position to start from spritesheet, defines which animation to play
  int w = 1000; //sprite- width/height
  int x; //x-position to place sprite
  int y; //y-position to place sprite  
  int aniFrames1;
  int aniFrames2;
  int cSize = 500;
  String pAnimation = "idle";
  boolean pDoinIt = false;
  PImage sprite; 
  
  Fighter f;
  
  Animation(int posX, int posY, Fighter f ){
    y = posY;
    x = posX;
    this.f = f;
    sprite = loadImage("frames/KICKnocolour_0000"+1+".png");
    sprite.resize(0,cSize);
    getAllFrames();
    counter = frameCount;
  }



  void anidraw(){
     
    x = round(f.location.x)-w/4;
    y = round(f.location.y)-w/3;
    if(pAnimation == "QuickAttack"){
      aniFrames1 = 16;
      pDoinIt = true;
      quickAttackAni();
    }
    if(pAnimation == "idle"){
      idle();
    }
    if(pAnimation == "run"){
      runForward();
    }
    if(pAnimation == "backStp"){
      backStp();
    }
     if(pAnimation == "block"){
      block();
    }
    image(sprite,x,y);
     //Post animation
     
     
    if(aniFrames1 < frameCount-counter){
      pDoinIt = false;
      pAnimation = "idle";
      f.movementSpeed=f.movementSpeedDef;
      
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
  
  void block(){
    aniFrames1 = 10;
    sprite = blockFrames.get(0);              
  }
  
  void idle(){
    aniFrames1 = 20;
    if(frameCount-counter<8)   sprite = idleFrames.get(0);
    if(frameCount-counter==8)  sprite = idleFrames.get(1);
    if(frameCount-counter==12) sprite = idleFrames.get(2);
    if(frameCount-counter==16) sprite = idleFrames.get(3);
    if(frameCount-counter>20) counter = frameCount;
              
  }
  

  
  void quickAttackAni(){   
    f.movementSpeed =0;
    if(frameCount-counter<8)   sprite = kickFrames.get(0);
    if(frameCount-counter==8)  sprite = kickFrames.get(1);
    if(frameCount-counter==12) sprite = kickFrames.get(2);
    if(frameCount-counter==12) f.movementSpeed = 10;     
  }
  
  void runForward(){
    if(frameCount-counter<8)   sprite = runFrames.get(0);
    if(frameCount-counter==8)  sprite = runFrames.get(1);
    if(frameCount-counter==12) sprite = runFrames.get(2);
    if(frameCount-counter==16) sprite = runFrames.get(3);
    if(frameCount-counter==20) sprite = runFrames.get(4);
    if(frameCount-counter>25) counter = frameCount;;
  }
  
  void backStp(){
    if(frameCount-counter<8)   sprite = backStpFrames.get(0);
    if(frameCount-counter==8)  sprite = backStpFrames.get(1);
    if(frameCount-counter==12) sprite = backStpFrames.get(2);
    if(frameCount-counter==16) sprite = backStpFrames.get(3);
    if(frameCount-counter>25) counter = frameCount;;
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
     PImage temp = loadImage("frames/KICKnocolour_0000"+i+".png");
     temp.resize(0,cSize);
     kickFrames.add(temp);
    }
    
    //BackSTP, 4 frames
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/BACKSTPnocolour_0000"+i+".png");
     temp.resize(0,cSize);
     kickFrames.add(temp);
    }
    
    //Idle, 4 frames
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/IDLEnocolur_0000"+i+".png");
     temp.resize(0,cSize);
     idleFrames.add(temp);
    }
    
    //runForward
    for(int i = 0; i<6; i++){
     PImage temp = loadImage("frames/RUNnonolour_0000"+i+".png");
     temp.resize(0,cSize);
     runFrames.add(temp);
    }
    
    //backStep
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/BACKSTPnocolour_0000"+i+".png");
     temp.resize(0,cSize);
     backStpFrames.add(temp);
    }
    
    //Block
    for(int i = 0; i<1; i++){
     PImage temp = loadImage("frames/BLOCKnocolour_0000"+i+".png");
     temp.resize(0,cSize);
     blockFrames.add(temp);
    }
  }
}
