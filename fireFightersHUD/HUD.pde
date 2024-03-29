class HUD{

  HUD(){
  
  }

void HealthBar(float life1, float life2, int victory1, int victory2){

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
  ellipse(width*11.85/20,height*4/20,width/30,width/30);
  if (victory2 == 1){fill(#FFC400);}
  ellipse(width*12.7/20,height*4/20,width/30,width/30);
  
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
  
  fill(255);
  textAlign(CENTER,CENTER);
  textSize(width/45);
  text("ROUND",width/2,height*2.25/20);
  textSize(width/30);
  text(round,width/2,height*3.5/20);
  textAlign(LEFT,CENTER);
  textSize(width/45);
  text("Player 1",width*8.5/20-256*width*1/800,height*4/20);
  textAlign(RIGHT,CENTER);
  text("Player 2",width*11.5/20+256*width*1/800,height*4/20);
 } 
 
void announcer(float timer, int mode){
  fill(0);
  textSize(width/12);
  textAlign(CENTER, CENTER);
  
  if (timer >= 0 && timer <= 125){
    if(mode >= 1){
    text("K.O.",width/2,height/2);
    }else{
    text("DRAW",width/2,height/2);
    }
  }
  
  
  if (mode <= 1){
  if (timer >= 170 && timer <= 255){
    textSize(width/20);
    text("ROUND "+round,width/2,height/2);  
  }
  
  if (timer >= 256 && timer < 300){
    text("FIGHT!",width/2,height/2);  
   }
  } 
 
 if (mode == 2){
   if (timer >= 170){
    textSize(width/20);
    text("PLAYER 1 WINS",width/2,height/2); 
   }
  }
 
 if (mode == 3){
   if (timer >= 170){
    textSize(width/20);
    text("PLAYER 2 WINS",width/2,height/2); 
   }
  }
 }
}
