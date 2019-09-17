int victoryPlayer1 =0;
int victoryPlayer2=0;
float lifePlayer1 = 256;
float lifePlayer2 = 256;
int round = 1;
int c;

Fighter fighter = new Fighter(200,450);

HUD hud = new HUD();

void setup(){
  background(255);
  size(1380,800);
  println("Round "+round);

}

void draw(){
  
 //Background
 background(255);
 rectMode(CORNER);
 fill(120);
 rect(0,570,width,height-570);


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

fighter.display(fighter.velocity.x,fighter.velocity.y,0,255,0);

hud.HealthBarPlayer1(lifePlayer1,victoryPlayer1);
hud.HealthBarPlayer2(lifePlayer2,victoryPlayer2);



//Win Round Condition

  if (lifePlayer1 <= 0 && lifePlayer2 <= 0){
  
   lifePlayer1 = 256;
   lifePlayer2 = 256;
   round += 1;
   println("Draw");
   println("Round "+round);
   println("Fight!");
  
  } else {if (lifePlayer1 <= 0){
   
   victoryPlayer2 += 1;
   lifePlayer1 = 256;
   lifePlayer2 = 256;
   round += 1;
   println("K.O.");
   println("Round "+round);
   println("Fight!");
   
  } else {if(lifePlayer2 <= 0){ 
   
   victoryPlayer1 += 1;
   lifePlayer1 = 256;
   lifePlayer2 = 256; 
   round += 1;
   println("K.O.");
   println("Round "+round);
   println("Fight!");
   
    }
   }
  }
 
//Win Round Condition
  
  if(victoryPlayer1 == 2){
    println("Player 1 wins");
  }
   if(victoryPlayer2 == 2){
    println("Player 2 wins");
 }
}
