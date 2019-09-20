class Bullet{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Bullet(PVector l){
    location= l.get();
    velocity= new PVector(0,0);
    acceleration= new PVector(0,0);
  }
  
  void applyForce(PVector force){
    PVector fo = force;
    acceleration.add(fo);
  }
  
  void run(){
    applyForce(new PVector(5,0));
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);    
  }
   
  void display(){
    stroke(0);
    fill(150,150,150,50);
    ellipse(location.x, location.y, 15,15);
  }  

  void checkEdges(){
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    if (location.y > height) {
      location.y=height;
      velocity.y *= -1;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
  boolean isDead(){
    if (location.x>width+10){
      return true;
    } else {
      return false;
    }
  }  
}

import java.util.Iterator;

class BulletSystem{
  ArrayList bullets;
  PVector origin;
  int amount;
  
  BulletSystem(PVector location){
    origin = location.get();
    bullets = new ArrayList();
    amount = 3;
  }
  
  void addParticle(){
    if (frameCount%20==0){
      bullets.add(new Bullet(origin));
    }
  }
  
  void run(){
    if (bullets.size() < amount){
    addParticle();
    }
    
    Iterator<Bullet> it = bullets.iterator();
    
    while (it.hasNext()) {
      Bullet p = it.next();
      p.run();
      if(p.isDead()){
        it.remove();
        amount--;
      }
    }
  }

  
  
}
