Fighter player1;
Fighter player2;

Animation ani1;
Animation ani2;
Sounds sfx;
static PApplet main;

HUD hud = new HUD();
int ballz = 0;

Fireball fireballs[] = new Fireball[12];


void setup(){
  frameRate(60);
  player1 = new Fighter(width/2-500,800,0,200,20,1);
  player2 = new Fighter(width/2+500,800,200,0,20,2);
  main=this;
  
  ani1 = new Animation(0,50, player1);
  ani2 = new Animation(0,50, player2);
  sfx = new Sounds();
  background(255);
  size(1920,1080);  //pretty much only works in 1080p (1920x1080)
 
  controlInitialize();
  
  for (int i=0;i<fireballs.length;i++){
    fireballs[i]= new Fireball(0,0,0);
  }
}

void draw(){
  //Background
  background(255);
  rectMode(CORNER);
  fill(120);
  rect(0,900,1920,1080);
  
  sfx.loopSoundtrack();
   
  ani1.anidraw();
  ani2.anidraw();
  player1.playerDraw();
  player2.playerDraw();
  absForLife();
  ellipseMode(CENTER);
  fill(255,0,0);
  ellipse(player1.location.x,player1.location.y,10,10);

  //display fireballs
  for (int i=0; i<fireballs.length;i++){
    
    fireballs[i].update();
    fireballs[i].display();    
    
  }

}


void controlInitialize(){
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("Player1Controller");
  if(gpad == null){
    println("No suitable device configured");
    System.exit(-1);
  }
}


void keyPressed(){
   if(key =='a' || key =='A'){
     player2.Left = true;
     player2.Right = false;
   }
   if(key =='d' || key =='D'){
     player2.Left = false;
     player2.Right = true;
   }
   if(key =='w' || key =='W'){
     player2.A = true;
   }
   if(key =='j' || key =='J'){
     player2.X = true;
   }
   if(key =='k' || key =='K'){
     player2.B = true;
   }
   if(key =='l' || key =='L'){
     player2.Y = true;
   }
   if(key ==' '){
     player2.Block = true;
   }
   if (key == CODED) {
     if (keyCode == SHIFT) {
       player2.Block = true;
     }
   }
 }


void keyReleased(){
  if(key =='a' || key =='A'){
    player2.Left = false;
  }
  if(key =='d' || key =='D'){
    player2.Right = false;
  }
  if(key =='w' || key =='W'){
    player2.A = false;
  }
  if(key =='j' || key =='J'){
    player2.X = false;
  }
  if(key =='k' || key =='K'){
    player2.B = false;
  }
  if(key =='l' || key =='L'){
    player2.Y = false;
  }
  if(key ==' '){
    player2.Block = false;
  }
  if (key == CODED) {
    if (keyCode == SHIFT) {
      player2.Block = false;
    }
  }
} 
