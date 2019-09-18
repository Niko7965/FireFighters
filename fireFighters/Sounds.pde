import processing.sound.*;


class Sounds{
  
  
  
  void playSound(String name){
    SoundFile file = new SoundFile(main,"audio/"+ name);
    file.play();
    
    
    
  }


}
