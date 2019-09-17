class HUD{

  HUD(){
  
  }

void HealthBarPlayer1(float life, int victory){
  rectMode(CORNER);
  fill(0,0,255);
  rect(width/12-10,height/12-10,276,70);
  
  fill(#E3E3E3);
  rect(width/12,height/12,256,20);
  
  ellipseMode(CENTER);
  if (victory == 2){fill(#FFC400);}
  ellipse(width/12+216,height/12+40,20,20);
  if (victory == 1){fill(#FFC400);}
  ellipse(width/12+246,height/12+40,20,20);
  
   if (life > 0) {
  if (life == 256) {
    fill(0,255,0);
  }else{
    fill(255,life,0);}
  rect(width/12,height/12,life,20);

  }
}

void HealthBarPlayer2(float life, int victory){
  
  rectMode(CORNER);
  fill(0,0,255);
  rect(width*11/12+10,height/12-10,-276,70);
  
  fill(#E3E3E3);
  rect(width*11/12,height/12,-256,20);
  
  ellipseMode(CENTER);
  if (victory == 2){fill(#FFC400);}
  ellipse(width*11/12-216,height/12+40,20,20);
  if (victory == 1){fill(#FFC400);}
  ellipse(width*11/12-246,height/12+40,20,20);
  
   if (life > 0) {
  if (life == 256) {
    fill(0,255,0);
  }else{
    fill(255,life,0);}
  rect(width*11/12,height/12,-life,20);




  }
 }

}
