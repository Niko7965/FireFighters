import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;






class Fighter{
  
  float p1LeftX, p1LeftY, p2LeftX, p2RightX, p2RightY;
  boolean p1A, p1X, p1Y, p1B, p1Block;
  PVector gravity = new PVector(0,2);
  PVector location;
  PVector velocity;
  
  Fighter(float x, float y){   
    
  location = new PVector(x,y);
  velocity = new PVector(0,0); 
  
}



void playerDraw(){
  getUserInput();
  moveCheck();
  display(player1.location.x,player1.location.y,0,255,0);
  
  
}

public void getUserInput(){
  p1LeftX = map(gpad.getSlider("P1XStick").getValue(), -1, 1,-10, 10);
  p1LeftY = map(gpad.getSlider("P1YStick").getValue(), -1, 1,-10, 10);
  p1A = gpad.getButton("P1A").pressed();
  p1B = gpad.getButton("P1B").pressed();
  p1Y = gpad.getButton("P1Y").pressed();
  p1X = gpad.getButton("P1X").pressed();
  if (gpad.getSlider("R2").getValue() > -0.2){
    p1Block = true;
  }
  else{
    p1Block = false;
  } 
}

public void moveCheck(){
  velocity.x = p1LeftX;
  if(location.x>width && velocity.x > 0){
    velocity.x = 0;
  }
  if(location.x<0 && velocity.x < 0){
    velocity.x = 0;
  }
  if (abs(velocity.x) < 1){
    velocity.x = 0;
  }
  
  location.add(velocity);
  if(location.y < 800){
    velocity.add(gravity);
    println("GravityApplied");
  }
  else{
    location.y = 800;
  }
  
  
  if(p1A == true){
    jump();
    
  }
  if(p1B == true){
    powerAttack();
  }
  if(p1X == true){
    quickAttack();
  }
  if(p1Y == true){
    rangedAttack();
  }
  
  //KeyboardControlls
if (keyPressed == true) {
  if (key == CODED) {
    if (keyCode == RIGHT){
    
  player1.velocity.x = 2;
    } else { if (keyCode == LEFT)
  player1.velocity.x = -2;
      
    }
  }
}
  
}



void jump(){
  println(velocity.y);
  if(location.y > 795){
    velocity.add(0,-50);
    print("Jumpin");
  }  
}

void powerAttack(){

}

void quickAttack(){
  
}

void rangedAttack(){

}





void display(float x, float y, float R, float G, float B){
  stroke(0);
  fill(R,G,B);
  rectMode(CENTER);
  rect(x,y,100,-240);
}

}
