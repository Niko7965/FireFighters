class HUD{

  HUD(){
  
  }

  void HealthBar(float life1, float life2, int victory1, int victory2, int round){
  
    //Blue Box
    strokeWeight(2);
    stroke(0);
    rectMode(CORNERS);
    fill(0,0,255);
    rect(width*8/20-256*width*1/800,height*1.5/20,width*12/20+256*width*1/800,height*5/20); 
    
    //Round Square
    strokeWeight(8);
    stroke(#E3E3E3);
    fill(0);
    rect(width*9/20,height*1.5/20,width*11/20,height*5/20);
    
    //Empty Health Bars
    strokeWeight(2);
    stroke(0);
    rectMode(CORNER);
    fill(#E3E3E3);
    rect(width*8.5/20,height*2/20,-256*width/800,height/20);
    rect(width*11.5/20,height*2/20,256*width/800,height/20);
    
    //Victory Counter
    ellipseMode(CENTER);
    if (victory1 == 2){fill(#FFC400);}
    ellipse(width*7.3/20,height*4/20,width/30,width/30);
    if (victory1 == 1){fill(#FFC400);}
    ellipse(width*8.15/20,height*4/20,width/30,width/30);
    fill(#E3E3E3);  
    if (victory2 == 2){fill(#FFC400);}
    ellipse(width*12.7/20,height*4/20,width/30,width/30);
    if (victory2 == 1){fill(#FFC400);}
    ellipse(width*11.85/20,height*4/20,width/30,width/30);
    
    //Health Bar
    rectMode(CORNER);
     if (life1 > 0) {
    if (life1 == 256) {
      fill(0,255,0);
    }else{
      fill(255,life1,0);}
    rect(width*8.5/20,height*2/20,-life1*width/800,height/20);
    }
     if (life2 > 0) {
    if (life2 == 256) {
      fill(0,255,0);
    }else{
      fill(255,life2,0);}
    rect(width*11.5/20,height*2/20,life2*width/800,height/20);
    }
    
    //Special bar
    fill(100,0,100);
    rect(width*8.5/20-256*width*1/800,height*3.5/20,194,height/20);
    fill(170,0,170);
    rect(width*8.5/20-256*width*1/800,height*3.5/20,specialPlayer1,height/20);
    fill(255,0,255,0);
  
    if(specialPlayer1 >= 192){fill(255,0,255,255);}
    rect((192*5/6)+width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    if(specialPlayer1 >= 160){fill(255,0,255,255);}
    rect((192*4/6)+width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    if(specialPlayer1 >= 128){fill(255,0,255,255);}
    rect((192*3/6)+width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    if(specialPlayer1 >= 96){fill(255,0,255,255);}
    rect((192*2/6)+width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    if(specialPlayer1 >= 64){fill(255,0,255,255);}
    rect((192/6)+width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    if(specialPlayer1 >= 32){fill(255,0,255,255);}
    rect(width*8.5/20-256*width*1/800,height*3.5/20,192/6,height/20);
    
    
    fill(100,0,100);
    rect(width*11.5/20+256*width*1/800,height*3.5/20,-194,height/20);
    fill(170,0,170);
    rect(width*11.5/20+256*width*1/800,height*3.5/20,-specialPlayer2,height/20);
    fill(255,0,255,0);
    if(specialPlayer2 >= 192){fill(255,0,255,255);}
    rect((-192*5/6)+width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
    if(specialPlayer2 >= 160){fill(255,0,255,255);}
    rect((-192*4/6)+width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
     if(specialPlayer2 >= 128){fill(255,0,255,255);}
    rect((-192*3/6)+width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
    if(specialPlayer2 >= 96){fill(255,0,255,255);}
    rect((-192*2/6)+width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
    if(specialPlayer2 >= 64){fill(255,0,255,255);}
    rect((-192/6)+width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
    if(specialPlayer2 >= 32){fill(255,0,255,255);}
    rect(width*11.5/20+256*width*1/800,height*3.5/20,-192/6,height/20);
    
    
    
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(width/45);
    text("ROUND",width/2,height*2.25/20);
    textSize(width/32);
    if(round == 3) {
      text("FINAL",width/2,height*3.5/20);}
    else{ 
      text(round,width/2,height*3.5/20); }
  }
   
   
  void announcer(float timer, int mode){
    fill(0);
    textSize(width/12);
    textAlign(CENTER, CENTER);
    
    if (timer >= 0 && timer <= 125){
      text("K.O.",width/2,height/2);
      if(timer < 5){
        sfx.playSound("KO.wav",1);
      }
    }
    
    if (mode == 0){
    if (timer >= 170 && timer <= 255){
      textSize(width/20);
      if (round == 3){
        text("FINAL ROUND",width/2,height/2);
        if(round3Done == false){
          sfx.playSound("FinalRoundFight.wav",1);
          
          round3Done = true;
        }
        
      
      } else { 
        text("ROUND "+round,width/2,height/2);
        if(round1Done == false){
          sfx.playSound("Round1Fight.wav",1);
          sfx.playSoundtrack(0.1);
          sfx.musicStarted = true;
          round1Done = true;
        }
        else{
          if(round2Done == false && round==2){
          sfx.playSound("Round2Fight.wav",1);
          round2Done = true;
        }
        }
      }
    }
    
    if (timer >= 256 && timer < 300){
      text("FIGHT!",width/2,height/2);  
      player1.location.x = width/2-500;
      player2.location.x = width/2+500;
      lifePlayer1 = 256;
      lifePlayer2 = 256;
      ballz = 0;
       for (int i=0;i<fireballs.length;i++){
       fireballs[i]=new Fireball(0,0,0);
       }
    }
   } 
   
   if (mode == 1){
     if (timer >= 170){
      textSize(width/20);
      text("PLAYER 1 WINS",width/2,height/2); 
      if(p1WinDone == false){
         sfx.playSound("P1Victory.wav",1.5);
         p1WinDone = true;
      }
     }
    }
   
   if (mode == 2){
     if (timer >= 170){
      textSize(width/20);
      text("PLAYER 2 WINS",width/2,height/2); 
      if(p2WinDone == false){
         sfx.playSound("P2Victory.wav",1.5);
         p2WinDone = true;
      }
     }
    }
    
     if (mode == 3){
     if (timer >= 170){
      textSize(width/20);
      text("DRAW",width/2,height/2); 
     }
    }
    
   }
  }
