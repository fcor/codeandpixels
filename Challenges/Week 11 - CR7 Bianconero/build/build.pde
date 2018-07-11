import hype.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;
import hype.extended.colorist.HPixelColorist;

int myStageW = 756;
int myStageH = 945;
int twitch = 40;
int poolNum = 150;

color clrBG = #000000;

HCanvas c1;
HCanvas c2;
HPixelColorist colors;
HSwarm sw1;
HSwarm sw2;
HSwarm sw3;
HSwarm sw4;
HSwarm sw5;
HSwarm sw6;
HDrawablePool p1;
HDrawablePool p2;
HDrawablePool p3;
HDrawablePool p4;
HDrawablePool p5;
HDrawablePool p6;
HTimer timer;
HTimer timer2;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	colors = new HPixelColorist("cr7.jpg").fillOnly();

	c1 = new HCanvas().autoClear(false).fade(1);
	c2 = new HCanvas().autoClear(false);
	H.add(c1);
	H.add(c2);

// Swarm & Pool #1 Top Left
	sw1 = new HSwarm()
		.addGoal(189,130)
		.speed(5)
		.turnEase(0.025f)
		.twitch(twitch)
	;
	
	p1 = new HDrawablePool(poolNum);
	p1.autoParent(c1)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable a = (HDrawable) obj;
					a
						.size((int)random(10,20), (int)random(2,6))
						.noStroke()
						.fill( #000000 )
						.loc( 189,130 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw1.addTarget(a);
				}
			}
		)
	;

// Swarm & Pool #2 Top Right
	sw2 = new HSwarm()
		.addGoal(567,130)
		.speed(5)
		.turnEase(0.025f)
		.twitch(twitch)
	;
	
	p2 = new HDrawablePool(poolNum);
	p2.autoParent(c1)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable b = (HDrawable) obj;
					b
						.size((int)random(10,20), (int)random(2,6))
						.noStroke()
						.fill( #000000 )
						.loc( 567,130 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw2.addTarget(b);
				}
			}
		)
	;

// Swarm & Pool #3 Center
	sw3 = new HSwarm()
		.addGoal(myStageW/2, myStageH/2)
		.speed(5)
		.turnEase(0.025f)
		.twitch(twitch)
	;
	
	p3 = new HDrawablePool(350);
	p3.autoParent(c1)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable c = (HDrawable) obj;
					c
						.size((int)random(10,20), (int)random(2,6))
						.noStroke()
						.fill( #000000 )
						.loc( myStageW/2, myStageH/2 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw3.addTarget(c);
				}
			}
		)
	;

// Swarm & Pool #4 Bottom Left
	sw4 = new HSwarm()
		.addGoal(189, 800)
		.speed(5)
		.turnEase(0.025f)
		.twitch(twitch)
	;
	
	p4 = new HDrawablePool(poolNum);
	p4.autoParent(c1)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(10,20), (int)random(2,6))
						.noStroke()
						.fill( #000000 )
						.loc( 189, 800 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw4.addTarget(d);
				}
			}
		)
	;

// Swarm & Pool #4 Bottom Right
	sw5 = new HSwarm()
		.addGoal(567, 800)
		.speed(5)
		.turnEase(0.025f)
		.twitch(twitch)
	;
	
	p5 = new HDrawablePool(poolNum);
	p5.autoParent(c1)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable e = (HDrawable) obj;
					e
						.size((int)random(10,20), (int)random(2,6))
						.noStroke()
						.fill( #000000 )
						.loc( 567, 800 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw5.addTarget(e);
				}
			}
		)
	;

// Swarm & Pool #5 Bottom 
	sw6 = new HSwarm()
		.addGoal(myStageW/2, 620)
		.speed(5)
		.turnEase(0.05f)
		.twitch(20)
	;
	
	p6 = new HDrawablePool(50);
	p6.autoParent(c2)
		.add (new HRect().rounding(4))
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					float rotation = random(TWO_PI);
					HDrawable f = (HDrawable) obj;
					f
						.size(10,3)
						.noStroke()
						.fill( #000000 )
						.loc( myStageW/2, 620 )
						.rotationRad(rotation)
						.move(cos(rotation)*10, sin(rotation)*10)
						.anchorAt( H.CENTER )
					;

					sw5.addTarget(f);
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( p1.numActive() )
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					p1.request();
					p2.request();
					p3.request();
					p4.request();
					p5.request();
				}
			}
		)
	;

	timer2 = new HTimer()
		.numCycles( p6.numActive() )
		.interval(50)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					p6.request();
				}
			}
		)
	;
}

void draw() {
	for(HDrawable a : p1) {
		colors.applyColor(a);
	}

	for(HDrawable b : p2) {
		colors.applyColor(b);
	}

	for(HDrawable c : p3) {
		colors.applyColor(c);
	}

	for(HDrawable d : p4) {
		colors.applyColor(d);
	}

	for(HDrawable e : p5) {
		colors.applyColor(e);
	}

	for(HDrawable f : p6) {
		colors.applyColor(f);
	}

	H.drawStage();
}

