


Fighter player1;
Fighter player2;


void setup(){
  background(255);
  size(1920,1080);
  player1 = new Fighter(200,800,0,200,20,1);
  player2 = new Fighter(800,800,200,0,20,2);
  controlInitialize();
}

void draw(){
  
  
  
  
 //Background
 background(255);
 rectMode(CORNER);
 fill(120);
 rect(0,900,1920,1080);

 player1.playerDraw();
 player2.playerDraw();

}


void controlInitialize(){
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("Player1Controller");
  if(gpad == null){
    println("No suitable device configured");
    System.exit(-1);
  } 
}
