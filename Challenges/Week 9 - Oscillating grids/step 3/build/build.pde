import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.behavior.HRotate;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 320;
int myStageH = 568;

color clrBG = #202020;

HCanvas c1;
HColorPool colors;
HDrawablePool pool;
HTimer timer;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(5);
	H.add(c1);

	colors = new HColorPool(#f6511d, #ffb400, #00a6ed, #7fb800, #0d2c54);

	pool = new HDrawablePool(66);
	pool.autoParent(c1)
		.add (new HShape("svg2.svg"))
		.layout(
			new HGridLayout()
				.startX(35)
				.startY(29)
				.spacing(50, 50)
				.cols(6)
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
						.stroke(#000000)
						.anchorAt(H.CENTER)
						.rotate( (int)random(4)*90 )
						// .size( 50 + ((int)random(2)*50) )
					;
					d.randomColors(colors.fillOnly());

					new HRotate(d, random(-2,2) );
					new HOscillator().target(d).property(H.SCALE).range(-1, 1).speed(.5).freq(5).currentStep(pool.currentIndex());

				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(50)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}

