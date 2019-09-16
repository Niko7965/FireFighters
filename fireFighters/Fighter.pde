import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;






class Fighter{
  
  
  float r,g,b;
  int playerNumber;
  float LeftX, LeftY;
  boolean A, X, Y, B, Block;
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
    LeftX = map(gpad.getSlider("P1XStick").getValue(), -1, 1,-10, 10);
    LeftY = map(gpad.getSlider("P1YStick").getValue(), -1, 1,-10, 10);
    A = gpad.getButton("P1A").pressed();
    B = gpad.getButton("P1B").pressed();
    Y = gpad.getButton("P1Y").pressed();
    X = gpad.getButton("P1X").pressed();
    if (gpad.getSlider("P1R2").getValue() > -0.2){
      Block = true;
    }
    else{
      Block = false;
    } 
  }


 /*if (playerNumber == 2){
    LeftX = map(gpad.getSlider("P2XStick").getValue(), -1, 1,-10, 10);
    LeftY = map(gpad.getSlider("P2YStick").getValue(), -1, 1,-10, 10);
    A = gpad.getButton("P2A").pressed();
    B = gpad.getButton("P2B").pressed();
    Y = gpad.getButton("P2Y").pressed();
    X = gpad.getButton("P2X").pressed();
    if (gpad.getSlider("P2R2").getValue() > -0.2){
      Block = true;
    }
    else{
      Block = false;
    } 
  }
  
  */
}






public void moveCheck(){
  velocity.x = LeftX;
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
  
  
  
  
  if(A == true){
    jump();
  }
  
  if(B == true){
    powerAttack();
  }
  
  if(X == true){
    quickAttack();
  }
  
  if(Y == true){
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
