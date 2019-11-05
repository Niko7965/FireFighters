class Animation{
  ArrayList<PImage> kickFrames = new ArrayList<PImage>();
  ArrayList<PImage> runFrames = new ArrayList<PImage>();
  ArrayList<PImage> backStpFrames = new ArrayList<PImage>();
  ArrayList<PImage> idleFrames = new ArrayList<PImage>();
  ArrayList<PImage> rangedFrames = new ArrayList<PImage>();
  ArrayList<PImage> smashFrames = new ArrayList<PImage>();
  ArrayList<PImage> blockFrames = new ArrayList<PImage>();
  ArrayList<PImage> fireballP1Frames = new ArrayList<PImage>();
  ArrayList<PImage> ascendFrames = new ArrayList<PImage>();
  ArrayList<PImage> descendFrames = new ArrayList<PImage>();
  ArrayList<PImage> damagedFrames = new ArrayList<PImage>();
  
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
  boolean pBlocking = false;
  PImage sprite; 
  PImage ascend;
  PImage descend;
  PImage damaged;
  
  Fighter f;
  
  Animation(int posX, int posY, Fighter f ){
    y = posY;
    x = posX;
    this.f = f;
    sprite = loadImage("frames/"+f.playerNumber+"IDLE"+1+".png");
    sprite.resize(0,cSize);
    getAllFrames();
    counter = frameCount;
    
  }
  
  
  void anidraw(){ 
    imageMode(CORNER);
    
    x = round(f.location.x)-w/4;
    y = round(f.location.y)-w/3;
    
    shadow(x, y);
    
    if(pAnimation == "QuickAttack"){
      aniFrames1 = 24;
      pDoinIt = true;
      quickAttackAni();
    }    
    if(pAnimation == "idle"){
      idle();
    }    
    if(pAnimation == "SmashAttack"){
      aniFrames1 = 68;
      pDoinIt = true;
      smash();
    }
    if(pAnimation == "stunned"){
      stunned();
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
    
    if(pAnimation == "ascending"){
      ascend();  
    }
    
    if((pAnimation == "descending")){  
      descend();
    }
    
    if(pAnimation == "RangedAttack"){
      aniFrames1 = 40;
      ranged();
    }

    
    if(f.playerNumber == 1){
      image(sprite,x-30,y+40);       
    }    
    if(f.playerNumber == 2){
      image(sprite,x+30,y+40);       
    }
     
    if(aniFrames1 < frameCount-counter){
      if(pBlocking == false){
        pDoinIt = false;
        pAnimation = "idle";
        f.movementSpeed=f.movementSpeedDef;       
      }
    } 
}
  
  void shadow(float x, float y){
    ellipseMode(CENTER);
    fill(0,0,0,160);
    noStroke();
    ellipse(x+250,960,0.5*y,0.2*y);
    
  }
  
  void ranged(){
    ny=0*w;
    f.movementSpeed =0;
    if(frameCount-counter<8)   sprite = rangedFrames.get(0);
    if(frameCount-counter==8)  sprite = rangedFrames.get(1);
    if(frameCount-counter==30) sprite = rangedFrames.get(2);
    if(frameCount-counter==34) f.rangedAttackFireball(); 
    if(frameCount-counter==34) sprite = rangedFrames.get(3); 
  }
  
  void block(){
    aniFrames1 = 10;
    sprite = blockFrames.get(0);
    f.movementSpeed = 0;
  }
  
  void ascend(){
    aniFrames1 = 10;
    sprite = ascendFrames.get(0);    
  }
  
  void descend(){
   aniFrames1 = 10;
   sprite = descendFrames.get(0);
  }
  
  void idle(){
    aniFrames1 = 20;
    if(frameCount-counter<16)   sprite = idleFrames.get(0);
    if(frameCount-counter==16)  sprite = idleFrames.get(1);
    if(frameCount-counter==32) sprite = idleFrames.get(2);
    if(frameCount-counter==48) sprite = idleFrames.get(3);
    if(frameCount-counter>64) counter = frameCount;       
  }
    
  void stunned(){
    aniFrames1 = 10000;
    //if(frameCount-counter<4)       sprite = kickFrames.get(0);
    if(frameCount-counter < 4)   sprite = kickFrames.get(1); 
    if(frameCount-counter == 10)   sprite = kickFrames.get(0);
    if(frameCount-counter>30){
      pAnimation = "idle";
      pDoinIt = false;
      f.stunned = false;
      f.movementSpeed = f.movementSpeedDef;
    }
    
    
    
  }
  
  void quickAttackAni(){   
    f.movementSpeed =0;
    if(frameCount-counter<8)   sprite = kickFrames.get(0);
    if(frameCount-counter==8){
      sprite = kickFrames.get(1);
      f.quickAttackHitbox();
    }  
    if(frameCount-counter==16) sprite = kickFrames.get(2);    
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
    f.movementSpeed =0;
    if(frameCount-counter<8)   sprite = smashFrames.get(0);
    if(frameCount-counter==8)  sprite = smashFrames.get(1);
    if(frameCount-counter==38) sprite = smashFrames.get(2);
    if(frameCount-counter==44) f.powerAttackHitbox();
    if(frameCount-counter==44) sprite = smashFrames.get(3);   
  }
  
  void getAllFrames(){
    //kicks, 3 frames
    for(int i = 0; i<3; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"KICK"+i+".png");
     temp.resize(0,cSize);
     kickFrames.add(temp);
    }
    
    //Idle, 4 frames
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"IDLE"+i+".png");
     temp.resize(0,cSize);
     idleFrames.add(temp);
    }
      
    //runForward
    for(int i = 0; i<6; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"RUN"+i+".png");
     temp.resize(0,cSize);
     runFrames.add(temp);
    }
    
    //backStep
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"BACKSTP"+i+".png");
     temp.resize(0,cSize);
     backStpFrames.add(temp);
    }
    
    //Block
    for(int i = 0; i<1; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"BLOCK"+i+".png");
     temp.resize(0,cSize);
     blockFrames.add(temp);
    }
    
    //Ascend
    for(int i = 0; i<1; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"ASCEND"+i+".png");
     temp.resize(0,cSize);
     ascendFrames.add(temp);
    }
    
    //Descend
    for(int i = 0; i<1; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"DESCEND"+i+".png");
     temp.resize(0,cSize);
     descendFrames.add(temp);
    }
    
    
    //Smash
    for(int i = 0; i<5; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"SMASH"+i+".png");
     temp.resize(0,cSize);
     smashFrames.add(temp);
    }
    
    //Ranged
    for(int i = 0; i<4; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"LOW"+i+".png");
     temp.resize(0,cSize);
     rangedFrames.add(temp);
    }
    
    //Fireball p1
    for(int i = 0; i<3; i++){
     PImage temp = loadImage("frames/"+f.playerNumber+"BULLET"+i+".png");
     temp.resize(0,cSize);
     fireballP1Frames.add(temp);
    }
    
  }
}
