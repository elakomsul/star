//Assignment 2

PImage galaxy;

float r1 = 100.;
float r2 = 110.;
float r3 = 160.;


float xpos, ypos, zpos;
float xstep, ystep, zstep;
float masterrotate = 0.;
float mstep;

void setup()
{
  size(800, 600, OPENGL); // 3-D mode
  sphereDetail(10); // quality of sphere

  ypos = height/2;
  xpos = width/2;
  zpos = 200;

}


void draw()
{
  lights(); // gimme some lights
  background(0, 15, 155); //changed from red to pretty blue
  
  galaxy = loadImage("galaxy.jpg");
  image(galaxy, 0, 0, width, height);

  fill(0); //changed color to black
  stroke(#3683a6); // changed color to light blue
  strokeWeight(2); 

  // CAMERA
  translate(mouseX, mouseY, zpos); // move set to where my mouse is
  rotate(masterrotate, 100, 800, 5);

  // sun (CUSTOM SUN)
  pushMatrix();
  rotate(r2, 5, 20, 6);
  beginShape();
 vertex(0, -50); // changed from weird shape to star
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();

  // planet1
  pushMatrix(); // go up one level
  rotate(r1, 0, 1, 0); // spin around the y axis
  translate(100, 0); // offset by 100 points on the x
  sphere(20); // draw the sphere
  popMatrix(); // go down a level

  // planet2
  pushMatrix(); // go up one level
  rotate(r2, 0, 1, 0); // spin around the y axis
  translate(200, 0); // offset by 100 points on the x
  sphere(20); // draw the sphere

  // moon
  pushMatrix(); // go up another level
  rotate(r3, 1, 0, 0); // spin around the x axis
  translate(0, 75);
  sphere(10);
  popMatrix();

  popMatrix(); // go down a level

  r1 = r1 + 0.125;
  r2 = r2 - 0.125;
  r3 = r3 + 0.125;

  xpos+=xstep;
  ypos+=ystep;
  zpos+=zstep;
  masterrotate+=mstep;
}

