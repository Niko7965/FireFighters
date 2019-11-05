class HUD{

  HUD(){
  
  }

  void HealthBar(float life1, float life2, int victory1, int victory2, int round){
    
    //Blue Box
    strokeWeight(2);
    stroke(0);
    rectMode(CORNERS);
    fill(0,0,255);
    //rect(width*8/20-256*width*1/800,height*1.5/20,width*12/20+256*width*1/800,height*5/20); 
    
    //Victory Counter
    fill(#1A1A1A,112.5);
    stroke(0);
    ellipseMode(CORNER);
    if (victory1 == 2){fill(#FFDF0F);stroke(#FF8000);}
    ellipse(720.5,280,50,50);
    if (victory1 == 1){fill(#FFDF0F);stroke(#FF8000);}
    ellipse(780.5,280,50,50);
    fill(#1A1A1A,112.5);
    stroke(0);
    if (victory2 == 2){fill(#FFDF0F);stroke(#FF8000);}
    ellipse(1149.5,280,50,50);
    if (victory2 == 1){fill(#FFDF0F);stroke(#FF8000);}
    ellipse(1089.5,280,50,50);
    
    //Empty Health Bars
    strokeWeight(2);
    stroke(0);
    rectMode(CORNER);
    fill(#0200AF,112.5);
    rect(190,130,640,90);
    rect(1090,130,640,90);
    
    //Health Bar
    rectMode(CORNER);
     if (life1 > 0) {
    if (life1 == 256) {
      stroke(0,255,0);
      fill(0,255,0);
    }else{
      stroke(255,life1,0);
      fill(255,life1,0);}
    rect(830,130,-life1*2.5,90);
    }
     if (life2 > 0) {
    if (life2 == 256) {
      stroke(0,255,0);
      fill(0,255,0);
    }else{
      stroke(255,life2,0);
      fill(255,life2,0);}
    rect(1090,130,life2*2.5,90);
    }
    
    //Tint
    strokeWeight(2);
    stroke(#2929FF);
    fill(127.5,127.5,127.5,60);
    rectMode(CORNER);
    rect(190,130,640,90);
    rect(1090,130,640,90);
    
    //Special bar
    strokeWeight(2);
    noStroke();
    fill(100,0,100);
    rect(522.8,210,307.2,44);
    fill(170,0,170);
    rect(830,210,-specialPlayer1*1.6,44);
    noFill();
    
    stroke(#2929FF);
    if(specialPlayer1 >= 192){fill(255,0,255,255);}
    rect(830-51.2*5,210,-51.2,44);
    if(specialPlayer1 >= 160){fill(255,0,255,255);}
    rect(830-51.2*4,210,-51.2,44);
    if(specialPlayer1 >= 128){fill(255,0,255,255);}
    rect(830-51.2*3,210,-51.2,44);
    if(specialPlayer1 >= 96){fill(255,0,255,255);}
    rect(830-51.2*2,210,-51.2,44);
    if(specialPlayer1 >= 64){fill(255,0,255,255);}
    rect(830-51.2,210,-51.2,44);
    if(specialPlayer1 >= 32){fill(255,0,255,255);}
    rect(830,210,-51.2,44);
    
    noStroke();
    fill(100,0,100);
    rect(1090,210,307.2,44);
    fill(170,0,170);
    rect(1090,210,specialPlayer2*1.6,44);
    noFill();
    
    stroke(#2929FF);
    if(specialPlayer2 >= 192){fill(255,0,255,255);}
    rect(1090+51.2*5,210,51.2,44);
    if(specialPlayer2 >= 160){fill(255,0,255,255);}
    rect(1090+51.2*4,210,51.2,44);
    if(specialPlayer2 >= 128){fill(255,0,255,255);}
    rect(1090+51.2*3,210,51.2,44);
    if(specialPlayer2 >= 96){fill(255,0,255,255);}
    rect(1090+51.2*2,210,51.2,44);
    if(specialPlayer2 >= 64){fill(255,0,255,255);}
    rect(1090+51.2,210,51.2,44);
    if(specialPlayer2 >= 32){fill(255,0,255,255);}
    rect(1090,210,51.2,44);

    //Clock
    rectMode(CORNER);
    strokeWeight(8);
    stroke(#CCCCCC);
    fill(#525252);
    rect(865,87.5,190,190);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(42);
    text("TIME",960,121.5);
    textSize(70);
    text(timeLeft,960,190); 
    
    
    //Frame
    imageMode(CORNER);
    image(healthBarPlayer1IMG,170,95);
    image(healthBarPlayer2IMG,1070,95);
    noFill();
    strokeWeight(3);
    stroke(#2929FF);
    rect(1070,95,680,175);
    rect(170,95,680,175);
    fill(255);
    textSize(36);
    textAlign(RIGHT,CENTER);
    text("Spiller 2",1730,125);
    textAlign(LEFT,CENTER);
    text("Spiller 1",190,125);
    
      
  }
   
   
  void announcer(float timer, int mode){
    fill(0);
    textSize(width/12);
    textAlign(CENTER, CENTER);
    
    if (timer >= 0 && timer <= 125){
     if(timeLeft == 0){
      text("TIME'S UP!",width/2,height/2);
     }else{ 
      text("K.O.",width/2,height/2);
      if(timer < 5){
        sfx.playSound("KO.wav",1);
      }
    }
  }
    
    if (mode == 0){ 
    if (timer >= 170 && timer <= 255){
      timeLeft = timeLimit;
      player1.location.set(width/2-500,800);
      player2.location.set(width/2+500,800);
      ballz = 0;
       for (int i=0;i<fireballs.length;i++){
       fireballs[i]=new Fireball(0,0,0);
       }
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
      //timeLeft = timeLimit;
      seconds = second();
      minutes = minute();
      lifePlayer1 = 256;
      lifePlayer2 = 256;
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
