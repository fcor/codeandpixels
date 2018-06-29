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

int n = 0;
int c = 5;

int start = 0;

public void setup() {
  
  colorMode(HSB, 360, 255, 255);
}

public void draw() {
  background(0);
  translate(width / 2, height / 2);
  for (int i = 0; i < n; i++) {
    float a = i * radians(137.3f);
    float r = c * sqrt(i);
    float x = r * cos(a);
    float y = r * sin(a);
    // float hu = i+start;
    // float hu = sin(start + i * 0.5);
    float hu = i/3.0f % 360;
    // float hu = (a - r) % 255;
    fill(hu, 255, 255);
    noStroke();
    ellipse(x, y, 5, 5);
  }
  n += 4;
  start += 5;
}
  public void settings() {  size(620, 620); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
