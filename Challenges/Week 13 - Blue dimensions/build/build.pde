void setup() {
	size(1300, 740);
	// background(152, 193, 217);
	background(0, 0, 0);
	noFill();
	// stroke(147, 129,255);
	strokeWeight(.1);
	// stroke(244, 211, 94, 100);
	stroke(14, 177, 211, 100);
	// colorMode(HSB, 360, 255, 255);
	
	// frameRate(1000);
}

void draw() {
	float t = (float)frameCount;

	translate(width/2, height/2);

	rotate(t/200);
	// stroke(sin(t)*255, 0, tan(t)*255, 50);
	// float hu = t % 255;
 //    stroke(hu, 255, 255, 50);

	rect(cos(t/140)*200, sin(t/140)*200, atan(t/140)*200, tan(t/140)*200); // Post! BG: Black SW: .1 stroke(0, 255, 0, 50);

}

void keyPressed() {
  if (key == 's') saveImage();
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame("./render/"+timestamp+".png");
}