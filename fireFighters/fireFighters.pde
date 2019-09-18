
Fighter player1;
Fighter player2;

PImage sprite;
int counter;
Animation ani;
Sounds sfx;
static PApplet main;

void setup(){
  main=this;
  sprite = loadImage("spritesheet_BUTT.png");
  ani = new Animation(0,50);
  sfx = new Sounds();
  background(255);
  size(1920,1080);
  player1 = new Fighter(200,800,0,200,20,1);
  player2 = new Fighter(800,800,200,0,20,2);
  controlInitialize();
}

void draw(){
 //Background
 background(255);
 rectMode(CORNER);
 fill(120);
 rect(0,900,1920,1080);
 
 ani.anidraw();
 player1.playerDraw();
 player2.playerDraw();

}


void controlInitialize(){
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("Player1Controller");
  if(gpad == null){
    println("No suitable device configured");
    System.exit(-1);
  }
}
  void keyPressed(){


       if(key =='a' || key =='A'){
         player2.Left = true;
         player2.Right = false;

       }
       if(key =='d' || key =='D'){
         player2.Left = false;
         player2.Right = true;

       }
       if(key =='w' || key =='W'){
         player2.A = true;
       }
       if(key =='j' || key =='J'){
         player2.X = true;
       }
       if(key =='k' || key =='K'){
         player2.B = true;
       }
       if(key =='l' || key =='L'){
         player2.Y = true;
       }
       if(key ==' '){
         player2.Block = true;

       }
     }


   void keyReleased(){



          if(key =='a' || key =='A'){
            player2.Left = false;

          }
          if(key =='d' || key =='D'){
            player2.Right = false;
          }
          if(key =='w' || key =='W'){
            player2.A = false;
          }
          if(key =='j' || key =='J'){
            player2.X = false;
          }
          if(key =='k' || key =='K'){
            player2.B = false;
          }
          if(key =='l' || key =='L'){
            player2.Y = false;
          }
          if(key ==' '){
            player2.Block = false;

          }

      }
