import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;






class Fighter{
  int movementSpeed = 10;
  int fighterHeight = 240;
  int fighterWidth = 100;
  int hp = 255;
  float r,g,b;
  int playerNumber;
  float LeftX, LeftY;
  boolean A, X, Y, B, Block, Left, Right, Up, Down;
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

    Left = false;
    Right = false;

    if(LeftX > 2){
      Left = false;
      Right = true;

    }
    if(LeftX < -2){
      Left = true;
      Right = false;

    }
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

}





public void moveCheck(){
  velocity.x = 0;
  if(Left == true){
    velocity.x += -1*movementSpeed;
  }
  if(Right == true){
    velocity.x += movementSpeed;
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
    rectMode(CENTER);
    fill(0,0,100);
    int qAWidth = 100;
    int qAHeight = 20;
    if(playerNumber == 1){
      rect(location.x+qAWidth,location.y,qAWidth,qAHeight);
      if(location.x+2*qAWidth>player2.location.x){
        println("p2 hit");
        player2.location.x += 5;
      }

    }
    if(playerNumber == 2){
      rect(location.x-qAWidth,location.y,qAWidth,qAHeight);
      if(location.x-2*qAWidth<player1.location.x){
        println("p2 hit");
        player1.location.x -= 5;

      }
    }
  }

  if(Y == true){
    rangedAttack();
  }


}

void jump(){

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
    rect(x,y,fighterWidth,fighterHeight);
  }



 }
