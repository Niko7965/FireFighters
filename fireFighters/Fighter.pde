import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;






class Fighter{
  boolean stunned = false;
  int qAWidth = 200;
  int qAHeight = 500;
  int movementSpeed = 10;
  int movementSpeedDef= 10;
  float backWardsResistance = 0.7;
  float dmgResistance = 0.7;
  int fighterHeight = 350;
  int fighterWidth = 150;
  int hp = 255;
  float r,g,b;
  int playerNumber;
  float LeftX, LeftY;
  boolean A, X, Y, B, Block, Left, Right, Up, Down;
  PVector gravity = new PVector(0,2);
  PVector location;
  PVector velocity;
  float fighterSoundAmp = 0.2;

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
    if (gpad.getSlider("P1R2").getValue() < -0.2){
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
          if(ani2.pDoinIt == false){
            ani2.pAnimation = "run";
          }
          
        }
      }
      if(playerNumber==1){
          velocity.x += -1*movementSpeed*backWardsResistance;
          if(ani1.pDoinIt == false){
            ani1.pAnimation = "backStp";
          }
      }
      }


    if(Right == true){
      if(playerNumber ==1){
        if(location.x+(fighterWidth)<player2.location.x){
          velocity.x += movementSpeed;
          if(ani1.pDoinIt == false){
            ani1.pAnimation = "run";
          }
          
        }
      }
      if(playerNumber==2){
        velocity.x += movementSpeed*backWardsResistance;
        if(ani2.pDoinIt == false){
            ani2.pAnimation = "backStp";
          }
        
      }

    }


    //Adds velocity to location
    location.add(velocity);
    if(location.x > width){
      location.x = width;
    }
    
    if(location.x < 0){
      location.x = 0;
    }

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
    
     if(Block == true){
      block();
    }
    
    if(Block == false){
      if(playerNumber == 1){
        ani1.pBlocking = false;
      }
       if(playerNumber == 2){
        ani2.pBlocking = false;
      }
    }


 }


void block(){
  if(playerNumber == 1){
    if(ani1.pDoinIt == false || ani1.pAnimation == "block"){
      ani1.pBlocking = true;
      ani1.pAnimation = "block";
      ani1.pDoinIt = true; 
      player1.dmgResistance = 0.5;
      player1.movementSpeed = 0;
    }
  }
  
  if(playerNumber == 2 || ani2.pAnimation == "block"){
    if(ani2.pDoinIt == false){
      ani2.pBlocking = true;
      ani2.pAnimation = "block";
      ani2.pDoinIt = true;
      player2.dmgResistance = 0.5;
      player2.movementSpeed = 0;
    }
  }
}

void jump(){

  if(location.y > 795){
    velocity.add(0,-50);
  
  }
}

void powerAttack(){
  if(playerNumber == 1 && ani1.pDoinIt == false){
    sfx.playSound("Yeetus.wav",fighterSoundAmp);
  }
  

}

void quickAttack(){
  
    
    
    if(playerNumber == 1 && ani1.pDoinIt == false && Block != true && player1.location.y == 800){
      ani1.counter = frameCount;
      ani1.pAnimation = "QuickAttack";
      sfx.playSound("Kick1.wav",fighterSoundAmp);
        
  

    }
    if(playerNumber == 2 && ani2.pDoinIt == false && Block != true && player2.location.y == 800){
      ani2.counter = frameCount;
      ani2.pAnimation = "QuickAttack";
      sfx.playSound("Kick1.wav",fighterSoundAmp);    
    }
}



  void quickAttackHitbox(){
    rectMode(CENTER);
    fill(0,0,100);
     
     if(playerNumber == 1 && Block != true && player1.location.y == 800 && player2.Block == false){
      rect(location.x+qAWidth,location.y,qAWidth,qAHeight);
      if((location.x+qAWidth+fighterWidth>player2.location.x)&&(location.y-qAHeight-fighterHeight<player2.location.y)){        println("p2 hit");
        lifePlayer2 -= 20*player2.dmgResistance;
        player2.location.x += qAWidth;
      }
     if(playerNumber == 1 && Block != true && player1.location.y == 800 && player2.Block == true){
       stunned = true;
       ani1.pAnimation = "stunned";
       ani1.counter = frameCount;
       ani1.pDoinIt = true;
     
     }
    

    }
    if(playerNumber == 2 && Block != true && player2.location.y == 800 && player1.Block == false){
      rect(location.x-qAWidth,location.y,qAWidth,qAHeight);
      if((location.x-fighterWidth - qAWidth<player1.location.x)&&(location.y-qAHeight-fighterHeight<player1.location.y)){
        println("p1 hit");
        lifePlayer1 -= 20*player1.dmgResistance;
        player1.location.x -= qAWidth;

      }
    }
    if(playerNumber == 2 && Block != true && player2.location.y == 800 && player1.Block == true){
       stunned = true;
       ani2.pAnimation = "stunned";
       ani2.counter = frameCount;
       ani2.pDoinIt = true;
     
     }
  
  
  }
  

  void rangedAttack(){
    sfx.playSound("Sasuke.wav",fighterSoundAmp);
  }
  



  void display(float x, float y, float r, float g, float b){
    stroke(0);
    fill(r,g,b,30);
    rectMode(CENTER);
    rect(x,y,fighterWidth,fighterHeight);
  }

}
