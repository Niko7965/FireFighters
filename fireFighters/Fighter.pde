import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;






class Fighter{
  
  
  float r,g,b;
  int playerNumber;
  float p1LeftX, p1LeftY, p2LeftX, p2RightX, p2RightY;
  boolean p1A, p1X, p1Y, p1B, p1Block;
  PVector gravity = new PVector(0,2);
  PVector location;
  PVector velocity;
  
  Fighter(float x, float y,float r, float g, float b, int n){   
    this.r = r;
    this.g = g;
    this.b = b;
    playerNumber = n;
    location = new PVector(x,y);
    velocity = new PVector(0,0); 
  
}



void playerDraw(){
  getUserInput();
  moveCheck();
  display(location.x,location.y,r,g,b);
  
  
}

public void getUserInput(){
  if (playerNumber == 1){
    p1LeftX = map(gpad.getSlider("P1XStick").getValue(), -1, 1,-10, 10);
    p1LeftY = map(gpad.getSlider("P1YStick").getValue(), -1, 1,-10, 10);
    p1A = gpad.getButton("P1A").pressed();
    p1B = gpad.getButton("P1B").pressed();
    p1Y = gpad.getButton("P1Y").pressed();
    p1X = gpad.getButton("P1X").pressed();
    if (gpad.getSlider("P1R2").getValue() > -0.2){
      p1Block = true;
    }
    else{
      p1Block = false;
    } 
  }


 if (playerNumber == 2){
    p1LeftX = map(gpad.getSlider("P2XStick").getValue(), -1, 1,-10, 10);
    p1LeftY = map(gpad.getSlider("P2YStick").getValue(), -1, 1,-10, 10);
    p1A = gpad.getButton("P2A").pressed();
    p1B = gpad.getButton("P2B").pressed();
    p1Y = gpad.getButton("P2Y").pressed();
    p1X = gpad.getButton("P2X").pressed();
    if (gpad.getSlider("P2R2").getValue() > -0.2){
      p1Block = true;
    }
    else{
      p1Block = false;
    } 
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
  
  //Adds velocity to location
  location.add(velocity);
  
  //Adds gravity to velocity, if the player is not already on the ground
  if(location.y < 800){
    velocity.add(gravity);
    
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
  
  
  
  
  //KeyboardControls, currently not working
  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == RIGHT){ 
        velocity.x = 8;
        
      }
      if (keyCode == LEFT){
       
        velocity.x = -8;        
      }  
     }
   }
  
}

void jump(){
  println(velocity.y);
  if(location.y > 795){
    velocity.add(0,-50);
    
  }  
}

void powerAttack(){

}

void quickAttack(){
  
}

void rangedAttack(){

}





void display(float x, float y, float r, float g, float b){
  stroke(0);
  fill(r,g,b);
  rectMode(CENTER);
  rect(x,y,100,-240);
}

}
