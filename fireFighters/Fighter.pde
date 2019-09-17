import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;

int movementSpeed = 10;




class Fighter{
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
    rect(x,y,100,-240);
  }

  void keyPressed(){

    if (playerNumber == 2){




         if(key =='a' || key =='A'){
           Left = true;
           Right = false;
           print("hithere");
         }
         if(key =='d' || key =='D'){
           Left = false;
           Right = true;
           print("r");
         }
         if(key =='w' || key =='W'){
           A = true;
         }
         if(key =='j' || key =='J'){
           X = true;
         }
         if(key =='k' || key =='K'){
           B = true;
         }
         if(key =='l' || key =='L'){
           Y = true;
         }
         if(key ==' '){
           Block = true;

         }
       }
     }

     void keyReleased(){

       if (playerNumber == 2){


            if(key =='a' || key =='A'){
              Left = false;

            }
            if(key =='d' || key =='D'){
              Right = false;
            }
            if(key =='w' || key =='W'){
              A = false;
            }
            if(key =='j' || key =='J'){
              X = false;
            }
            if(key =='k' || key =='K'){
              B = false;
            }
            if(key =='l' || key =='L'){
              Y = false;
            }
            if(key ==' '){
              Block = false;

            }

        }
      }

 }
