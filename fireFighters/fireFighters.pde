float R;
float G;
float B;



Fighter fighter = new Fighter(200,450);

void setup(){
  background(255);
  size(1280,720);
}

void draw(){
  
 //Background
 background(255);
 rectMode(CORNER);
 fill(120);
 rect(0,570,1280,200);

//Foghter 1 controls
if (keyPressed == true) {
  if (key == CODED) {
    if (keyCode == RIGHT){
    
  fighter.velocity.x = 2;
    } else { if (keyCode == LEFT)
  fighter.velocity.x = -2;
      
    }
  }
}

fighter.display(fighter.velocity.x,fighter.velocity.y,0,255,0);




}
