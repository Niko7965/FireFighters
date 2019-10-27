import processing.sound.*;

class Sounds{
  SoundFile soundTrack = new SoundFile(main,"audio/FightingThemeV1.wav");;
  SoundFile soundTrackLoop = new SoundFile(main,"audio/FightingThemeV1LoopThis.wav");;
  boolean musicStarted = false;
  boolean soundtrackPlaying = true;
  boolean soundtrackLoopPlaying = true;
  boolean looping = false;
 
  
  void playSoundtrack(float a){
    //soundTrack = new SoundFile(main,"audio/FightingThemeV1.wav");
    soundTrack.amp(a);
    soundTrack.play();  
  }
  
   void playSoundtrackLoop(float a){
    soundTrackLoop = new SoundFile(main,"audio/FightingThemeV1LoopThis.wav");
    soundTrackLoop.amp(a);
    soundTrackLoop.play();  
  }
  
  void playSound(String name, float a){
    SoundFile file = new SoundFile(main,"audio/"+ name);
    file.amp(a);
    file.play();   
  }
  
  void loopSoundtrack(){
    if(musicStarted == true){
      soundtrackPlaying = soundTrack.isPlaying();
      if(looping == true){
        soundtrackLoopPlaying = soundTrackLoop.isPlaying();
      }
      if(soundtrackPlaying == false && frameCount > 600){
        looping = true;
      }
     
      if(soundtrackLoopPlaying == false && looping == true){
        playSoundtrackLoop(0.1);
        soundtrackLoopPlaying = soundTrackLoop.isPlaying();
      }  
    }
  }
}
