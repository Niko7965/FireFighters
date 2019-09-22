class Fireball {
  float x;
  float y;
  float player;
  float fireballSize =80;
  float fireballSpeed = 15;

  Fireball(float xP, float yP, float p) {

    x = xP;
    y = yP;
    player = p;
  }
  
  void update() {
    if (player == 1) {
      x = x + fireballSpeed;
    }
    if (player == 2) {
      x = x - fireballSpeed;
    } 
    
    if ((player == 1) && (x+fireballSize/2+player2.fighterWidth/2 >= player2.location.x) && (x-player2.fighterWidth/2-fireballSize/2 <= player2.location.x) && (y-fireballSize/2-player2.fighterHeight/2<player2.location.y)) {
      lifePlayer2 -= 40;
      specialPlayer2 += 20;
      player = 0;
      player2.location.x += 100;
    }
    if ((player == 2) && (x+fireballSize/2+player1.fighterWidth/2 >= player1.location.x) && (x-player1.fighterWidth/2-fireballSize/2 <= player1.location.x) && (y-fireballSize/2-player1.fighterHeight/2<player1.location.y)) {
      lifePlayer1 -= 40;
      specialPlayer1 += 20;
      player = 0;
      player1.location.x -= 100;
    }
    
  }


  void display() {
   
    imageMode(CENTER);
    
    if(player == 1){
      
      image(projectilePlayer1IMG,x,y);
    }
    
    if(player == 2){
          image(projectilePlayer2IMG,x,y);
    }
    
    imageMode(CORNER);
    
    
  }
}
