import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import hype.*; 
import hype.extended.colorist.HColorPool; 
import hype.extended.layout.HGridLayout; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {





HDrawablePool pool;
HColorPool colors;

int     renderNum  = 18;
String  renderPATH = "render/";

public void setup(){
	
	H.init(this).background(0xff202020);
	

	// colors = new HColorPool(#6699cc, #fff275, #ff8c42, #ff3c38, #a23e48);
	colors = new HColorPool(0xfff46036, 0xff2e294e, 0xff1b998b, 0xffe71d36, 0xffc5d86d);
	// colors = new HColorPool(#220901, #621708, #941b0c, #bc3908, #f6aa1c);

	pool = new HDrawablePool(798);
	pool.autoAddToStage()

		// .add(new HShape("svg3.svg"))
		.add(new HShape("svg3.svg"))
		// .add(new HShape("svg2.svg"))

		.layout(
			new HGridLayout()
				.startX(35)
				.startY(40)
				.spacing(50, 50)
				.cols(38)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj){
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)   
						.strokeCap(ROUND)   
						.strokeWeight(0)
						.stroke(0xff000000)
						.anchorAt(H.CENTER)
						.rotate( (int)random(4)*90 )
						// .size( 50 + ((int)random(2)*50) )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
	save(renderPATH + renderNum + ".png");
}
  public void settings() { 	size(1920,1080); 	smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
