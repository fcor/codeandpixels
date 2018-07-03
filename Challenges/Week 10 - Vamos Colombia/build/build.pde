import hype.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HPixelColorist;

int myStageW = 1200;
int myStageH = 675;

color clrBG = #202020;

HPixelColorist colors;
HSwarm swarm;
HDrawablePool pool;
HTimer timer;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	colors = new HPixelColorist("colombia.jpg")
		.fillOnly()
		// .strokeOnly()
		// .fillAndStroke()
	;

	swarm = new HSwarm()
		.addGoal(H.mouse())
		.speed(5)
		.turnEase(0.05f)
		.twitch(20)
	;

	pool = new HDrawablePool(40);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(10,20), (int)random(2,6) )
						.noStroke()
						.fill( #000000 )
						.loc( myStageW/2, myStageH/2 )
						.anchorAt( H.CENTER )
					;

					colors.applyColor(d);

					swarm.addTarget(d);
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(250)
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
	for(HDrawable d : pool) {
		colors.applyColor(d.alpha(90));
	}

	H.drawStage();
}

