import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

public void setup() {
	
	// background(152, 193, 217);
	background(0, 0, 0);
	noFill();
	// stroke(147, 129,255);
	strokeWeight(.1f);
	// stroke(244, 211, 94, 100);
	stroke(14, 177, 211, 100);
	// colorMode(HSB, 360, 255, 255);
	
	// frameRate(1000);
}

public void draw() {
	float t = (float)frameCount;

	translate(width/2, height/2);

	rotate(t/200);
	// stroke(sin(t)*255, 0, tan(t)*255, 50);
	// float hu = t % 255;
 //    stroke(hu, 255, 255, 50);

	rect(cos(t/140)*200, sin(t/140)*200, atan(t/140)*200, tan(t/140)*200); // Post! BG: Black SW: .1 stroke(0, 255, 0, 50);

}

public void keyPressed() {
  if (key == 's') saveImage();
}

public void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame("./render/"+timestamp+".png");
}
  public void settings() { 	size(1300, 740); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
