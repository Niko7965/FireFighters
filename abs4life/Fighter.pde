class Fighter{
  
  float x;
  
  float y;
  
  PVector location;
  PVector velocity;
  
  Fighter(float x, float y){   
    
  location = new PVector(0,0);
  
  velocity = new PVector(x,y);
  
  location.add(velocity);
  
  
}

void getUSerInput() {
  
  
}





void display(float x, float y, float R, float G, float B){

  
  
stroke(0);
fill(R,G,B);
rectMode(CENTER);
 rect(x,y,100,-240);


}

}
