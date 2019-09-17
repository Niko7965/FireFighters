PImage sprite;
int counter;
Animation ani;

void setup(){
  size(400,600);
  sprite = loadImage("spritesheet_BUTT.png");
  frameRate(30);
  ani = new Animation(0,50);
}

void draw(){
  background(0);
  ani.ranged();
  ani.smash();
  
}

void mousePressed(){
  counter = frameCount;
  
}
