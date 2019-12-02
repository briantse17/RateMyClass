import java.io.File;
import java.io.IOException;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

public class Music implements Runnable {
	public Music() { }
	private String m = "src/backgroundMusic.wav";
    public void play() 
    {
        Thread t = new Thread(this);
        t.start();
    }

    private void playSound(String wav) 
    {
        File play = new File(wav);
        AudioInputStream audioInputStream = null;
        try 
        {
            audioInputStream = AudioSystem.getAudioInputStream(play);
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
        AudioFormat toPlay = audioInputStream.getFormat();
        SourceDataLine line = null;
        DataLine.Info i = new DataLine.Info(SourceDataLine.class, toPlay);
        try 
        {
            line = (SourceDataLine) AudioSystem.getLine(i);
            line.open(toPlay);
        } 
        catch (LineUnavailableException e) 
        {
            e.printStackTrace();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        line.start();
        int numberRead = 0;
        byte[] abData = new byte[128000];
        while (numberRead != -1) 
        {
            try 
            {
                numberRead = audioInputStream.read(abData, 0, abData.length);
            } 
            catch (IOException e) 
            {
                e.printStackTrace();
            }
            if (numberRead >= 0) 
            {
                int numberWritten = line.write(abData, 0, numberRead);
            }
        }
        line.drain();
        line.close();
    }
    
    @Override
    public void run() {
        playSound(m);
    }
}