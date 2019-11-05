int victoryPlayer1 = 0;
int victoryPlayer2 = 0;
float lifePlayer1 = 256;
float lifePlayer2 = 256;
float specialPlayer1 = 0;
float specialPlayer2 = 0;
int timeLimit = 90;
int timeLeft = timeLimit;
int seconds = second();
int minutes = minute();

int round = 1;
float timer = 156;
int mode =0;
Boolean round3Done = false;
Boolean round2Done = false;
Boolean round1Done = false;
Boolean p2WinDone = false;
Boolean p1WinDone = false;


void absForLife(){
  /*
  rectMode(CORNER);
  strokeWeight(1);
  fill(120);
  rect(0,height*9/10,width,height);
  */
  
  
  if (timer < 300){
    timer += 1;
  }
  
  hud.announcer(timer,mode);
  
  if (timer > 256 && mode == 0){
   
   
   timeLeft = timeLimit + (seconds - second())+(minutes - minute())*60;

    if (lifePlayer1 <= 0 || lifePlayer2 <= 0 || timeLeft == 0){
              
      if ((lifePlayer1 <= 0 && lifePlayer2 <= 0)||(lifePlayer1 == lifePlayer2)){
        //basically do nothing if both player's lives are at zero
        
      }else{
        if (lifePlayer1 < lifePlayer2){
          victoryPlayer2 += 1;
        }        
        if(lifePlayer2 < lifePlayer1){
          victoryPlayer1 += 1;
        }
      }
      
      //Win Game Condition
      if (round == 3 || victoryPlayer1 == 2 ||victoryPlayer2 == 2){
        if (victoryPlayer1 > victoryPlayer2){
          mode = 1;
        }       
        if (victoryPlayer1 < victoryPlayer2){
          mode = 2;
        }             
        if (victoryPlayer1 == victoryPlayer2){
          mode = 3;
        }   
        
      }else{
        round += 1;
      }
      timer = 0;
    }
     
  } else {   
    if(mode == 0){
    if(lifePlayer1 < 256){lifePlayer1 += 2;}
    if(lifePlayer2 < 256){lifePlayer2 += 2;}
    }
  }  
  hud.HealthBar(lifePlayer1,lifePlayer2,victoryPlayer1,victoryPlayer2,round);
}
