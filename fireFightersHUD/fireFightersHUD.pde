int victoryPlayer1 =0;
int victoryPlayer2=0;
float lifePlayer1 = 256;
float lifePlayer2 = 256;
int round = 1;
float timer = 156;
int mode =0;

Fighter fighter = new Fighter(200,450);

HUD hud = new HUD();

void setup(){
  background(255);
  size(960,540);

  println("Round "+round);
}

void draw(){
  
 //Background
 background(255);
 rectMode(CORNER);
 strokeWeight(1);
 fill(120);
 rect(0,height*9/10,width,height);
 //println(timer);
 
 if (timer < 300){
   timer += 1;
}
 hud.announcer(timer,mode);

if (timer > 256 && mode < 2){
//HealthBar controls
if (keyPressed == true) {
  if (key == CODED) {
    if (keyCode == RIGHT){
   
      
      lifePlayer2 -= 2;
      
      
   } else { if (keyCode == LEFT){
      
      lifePlayer1 -= 2;
      
   } else { if (keyCode == DOWN){
     
      lifePlayer1 -= 2;
      lifePlayer2 -= 2;
      
      }
     }
    }
   }
  }

if (lifePlayer1 <= 0 || lifePlayer2 <= 0){
    
    round += 1;
    
    mode = -1;
    
   if (lifePlayer1 <= 0 && lifePlayer2 <= 0){
     
   }else{if (lifePlayer1 <= 0){
   
    victoryPlayer2 += 1;
    
    mode = 1;
    
   }
    if(lifePlayer2 <= 0){ 
   
    victoryPlayer1 += 1;
    
    mode = 1;

     }
    }
    //Win Round Condition
   if(victoryPlayer1 == 2){
   mode = 2;
   }
   if(victoryPlayer2 == 2){
   mode = 3;
   }
  
   timer = 0;
  
   }
 } else {   
   if(lifePlayer1 < 256){lifePlayer1 += 1;}
   if(lifePlayer2 < 256){lifePlayer2 += 1;}
   hud.HealthBar(lifePlayer1,lifePlayer2,victoryPlayer1,victoryPlayer2);
 }
 
fighter.display(fighter.velocity.x,fighter.velocity.y,0,255,0);

hud.HealthBar(lifePlayer1,lifePlayer2,victoryPlayer1,victoryPlayer2);

}
