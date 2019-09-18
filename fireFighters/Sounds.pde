import processing.sound.*;
ArrayList<SoundFile> currentSounds = new ArrayList<SoundFile>();

class Sounds{
  
  
  
  void playSound(String name){
    SoundFile file = new SoundFile(main,"audio/"+ name);
    file.play();
    
    
    
  }


}
