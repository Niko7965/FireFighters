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

  Fighter(int x, int y,float r, float g, float b, int n){
    this.r = r;
    this.g = g;
    this.b = b;
    playerNumber = n;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
  }



void playerDraw(){
  
  if(timer>256 && mode == 0){
    getUserInput();
    moveCheck();
  }
  
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
      if(playerNumber ==2){
        if(location.x-(fighterWidth)>player1.location.x){
          velocity.x += -1*movementSpeed;
        }
      }
      if(playerNumber==1){
          velocity.x += -1*movementSpeed;
      }
      }


    if(Right == true){
      if(playerNumber ==1){
        if(location.x+(fighterWidth)<player2.location.x){
          velocity.x += movementSpeed;
        }
      }
      if(playerNumber==2){
        velocity.x += movementSpeed;
      }

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
  if(playerNumber == 1 && ani1.pDoinIt == false){
    sfx.playSound("Yeetus.wav");
  }
  

}

void quickAttack(){
  
    rectMode(CENTER);
    fill(0,0,100);
    int qAWidth = 100;
    int qAHeight = 20;
    if(playerNumber == 1 && ani1.pDoinIt == false){
      ani1.counter = frameCount;
      ani1.pAnimation = "QuickAttack";
      sfx.playSound("Kick1.wav");
      
      rect(location.x+qAWidth,location.y,qAWidth,qAHeight);
      if(location.x+2*qAWidth>player2.location.x){
        println("p2 hit");
        lifePlayer2 -= 20;
        player2.location.x += qAWidth;
      }

    }
    if(playerNumber == 2 && ani2.pDoinIt == false){
      ani2.counter = frameCount;
      ani2.pAnimation = "QuickAttack";
      sfx.playSound("Kick1.wav");
      rect(location.x-qAWidth,location.y,qAWidth,qAHeight);
      if(location.x-2*qAWidth<player1.location.x){
        println("p1 hit");
        lifePlayer1 -= 20;
        player1.location.x -= qAWidth;

      }
    }

}

void rangedAttack(){
  sfx.playSound("Sasuke.wav");
}



  void display(float x, float y, float r, float g, float b){
    stroke(0);
    fill(r,g,b);
    rectMode(CENTER);
    rect(x,y,fighterWidth,fighterHeight);
  }

}
