import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import hype.*; 
import hype.extended.behavior.HOscillator; 
import hype.extended.behavior.HRotate; 
import hype.extended.behavior.HTimer; 
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








int myStageW = 800;
int myStageH = 800;

int clrBG = 0xff202020;

HCanvas c1;
HColorPool colors;
HDrawablePool pool;
HTimer timer;

// *************************************************************************************************************

public void settings() {
	size(myStageW,myStageH);
}

public void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(5);
	H.add(c1);

	colors = new HColorPool(0xfff6511d, 0xffffb400, 0xff00a6ed, 0xff7fb800, 0xff0d2c54);
	// colors = new HColorPool(#6699cc, #fff275, #ff8c42, #ff3c38, #a23e48);

	pool = new HDrawablePool(256);
	pool.autoParent(c1)
		.add (new HShape("svg3.svg"))
		.add (new HShape("svg2.svg"))
		.layout(
			new HGridLayout()
				.startX(25)
				.startY(25)
				.spacing(50, 50)
				.cols(16)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
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

					new HRotate(d, random(-2,2) );
					new HOscillator().target(d).property(H.SCALE).range(-1, 1).speed(0.5f).freq(5).currentStep(pool.currentIndex());

				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(30)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

public void draw() {
	H.drawStage();
	surface.setTitle( 
		"FPS : " + PApplet.parseInt(frameRate)
	);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
