// declaration of variables and constants
int population = 50;
ArrayList<Particle> particles = new ArrayList<Particle>();

// paddle constants
int paddleLevel;
int paddleW;
int paddleH;

// this function runs once at the beginning when your run the program
void setup() {
  
  // set up canvas
  size(800,800);
  
  // assign values to global variables
  paddleLevel = height - 200;
  paddleW = 250;
  paddleH = 10;
  
  // populate the list "particles" with a bunch of particle objects
  for (int i = 0; i < population; i++) {
    particles.add(new Particle()); 
  } 
}

// this function runs every frame of the animation
void draw() {
  
  rectMode(CORNER);
  
  // alpha value effects length of trails
  fill(0,0,0,75);
  rect(0,0,width,height);
  noStroke();
  rectMode(CENTER);
  
  // draw paddle
  fill(255);
  rect(mouseX, paddleLevel, paddleW, paddleH);
  
  // update physics system and display each of the particles in the list "particles"
  for (int i = 0; i < population; i++) {
    particles.get(i).update();
    particles.get(i).display();
  }
  
  // draw the source of the particles
  fill(255);
  rect(width/2, 5, 150, 40);
}
