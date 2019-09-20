class Fireball {
  float x;
  float y;
  float player;
  float fireballSize = 40;
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
      lifePlayer2 -= 30;
      specialPlayer2 += 30;
      player = 0;
      player2.location.x += 100;
    }
    if ((player == 2) && (x+fireballSize/2+player1.fighterWidth/2 >= player1.location.x) && (x-player1.fighterWidth/2-fireballSize/2 <= player1.location.x) && (y-fireballSize/2-player1.fighterHeight/2<player1.location.y)) {
      lifePlayer1 -= 30;
      specialPlayer1 += 30;
      player = 0;
      player1.location.x -= 100;
    }
    
  }


  void display() {
    rectMode(CENTER);
    fill(255, 0, 255);
    if(player > 0){
      rect(x, y, fireballSize, fireballSize);
    }
    
    
    
    
  }
}
