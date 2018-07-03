size(800, 800);
noLoop();
background(255);

int     renderNum  = 6;
String  renderPATH = "../render/";

// float w = 3;
// float h  = 3;
// // float h = (w * height) / width;
// float xmin = -w/2;
// float ymin = -h/2;

float red, green, blue;

float w = 0.07;
float h = 0.07;

float xmin = 0.4;
float ymin = 0.32;


loadPixels();

colorMode(RGB);

int maxiterations = 200;

// x goes from xmin to xmax
float xmax = xmin + w;
// y goes from ymin to ymax
float ymax = ymin + h;

// Calculate amount we increment x,y for each pixel
float dx = (xmax - xmin) / (width);
float dy = (ymax - ymin) / (height);

// Start y
float y = ymin;
for (int j = 0; j < height; j++) {
  // Start x
  float x = xmin;
  for (int i = 0; i < width; i++) {

    // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
    float a = x;
    float b = y;
    int n = 0;
    while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab = 2.0 * a * b;
      a = aa - bb + x;
      b = twoab + y;
      // Infinty in our finite world is simple, let's just consider it 16
      if (dist(aa, bb, 0, 0) > 4.0) {
        break;  // Bail
      }
      n++;
    }

    // We color each pixel based on how long it takes to get to infinity
    // If we never got there, let's pick the color black
    if (n == maxiterations) {
      pixels[i+j*width] = color(0);
    } else {
      
      float norm = map(n, 0, maxiterations, 0, 1);
      red = map(sqrt(norm), 0, 1, 0, 255);
      green = (n * 7) % 255;
      blue = (n * 11) % 255;
      // red = (n * random(20)) % 255;
      // green = (n * random(5)) % 255;
      // blue = (n * random(11)) % 255;
      pixels[i+j*width] = color(red, green, blue);
    }
    x += dx;
  }
  y += dy;
}
updatePixels();

save(renderPATH + renderNum + ".png");