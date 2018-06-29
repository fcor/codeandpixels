int n = 0;
int c = 5;

int start = 0;

void setup() {
  size(620, 620);
  colorMode(HSB, 360, 255, 255);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  for (int i = 0; i < n; i++) {
    float a = i * radians(137.3);
    float r = c * sqrt(i);
    float x = r * cos(a);
    float y = r * sin(a);
    // float hu = i+start;
    // float hu = sin(start + i * 0.5);
    float hu = i/3.0 % 360;
    // float hu = (a - r) % 255;
    fill(hu, 255, 255);
    noStroke();
    ellipse(x, y, 5, 5);
  }
  n += 4;
  start += 5;
}