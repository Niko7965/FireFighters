int victoryPlayer1 =0;
int victoryPlayer2=0;
float lifePlayer1 = 256;
float lifePlayer2 = 256;
int round = 1;
float timer = 156;
int mode =0;
Boolean round3Done = false;
Boolean round2Done = false;
Boolean round1Done = false;
Boolean p2WinDone = false;
Boolean p1WinDone = false;
void absForLife(){
  
    
     rectMode(CORNER);
     strokeWeight(1);
     fill(120);
     rect(0,height*9/10,width,height);
     //println(timer);
     
     if (timer < 300){
       timer += 1;
    }
     hud.announcer(timer,mode);
    
    if (timer > 256 && mode == 0){
    
    
    if (lifePlayer1 <= 0 || lifePlayer2 <= 0){
        
       if (lifePlayer1 <= 0 && lifePlayer2 <= 0){
         
       }else{if (lifePlayer1 <= 0){
       
        victoryPlayer2 += 1;
        
       }
        if(lifePlayer2 <= 0){ 
       
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
       if(lifePlayer1 < 256){lifePlayer1 += 1;}
       if(lifePlayer2 < 256){lifePlayer2 += 1;}
       }
      }
     
    hud.HealthBar(lifePlayer1,lifePlayer2,victoryPlayer1,victoryPlayer2,round);

}
