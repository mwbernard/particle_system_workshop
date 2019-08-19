class Particle {
  
  // attributes that will be specific to each individual Particle object
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  
  // constructor method
  Particle() {
    pos.x = random(width);
    pos.y = random(height);
    vel = PVector.random2D();
  }
  
  
  // other methods
  
  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    
    // physics system
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    //acc = PVector.random2D();
    //acc.setMag(.1);

    // behavior at edges of screen
    if (pos.x < 10) { 
      vel.x = 1;
    } else if (pos.x > width - 10) {
      vel.x = -1;
    } else if (pos.y < 5) {
      vel.y = 1; 
    } else if (pos.y > height) { 
      pos.y = 10;
      pos.x = width/2;
      vel.y = 0;
    }

    // apply gravity
    // mess with gravity value
    applyForce(new PVector(0, .075));

    //check collision with paddle
    if (pos.x > mouseX - paddleW/2 && pos.x < mouseX + paddleW/2 && pos.y >= paddleLevel - 15 && pos.y <= paddleLevel) {
      
      // multiple ways to model a bounce
      // try using a different method; how does it effect the behavior of the particles - is it more or less realistic?
      vel.y = -5;
      //vel.y *= -.66;
      //applyForce(new PVector(0, -6));
    }
  }

  void display() {
    // set color
    fill(#339999);

    // push and pop matrix mean that translations we perform on this object do not effect other objects
    pushMatrix();
    translate(pos.x, pos.y);
    
    // mess with shape of particles
    ellipse(0,0,10,10);
    
    // this code makes rectangular particles that orient in the direction that they are moving
    //rotate(vel.heading());
    //rectMode(CENTER);
    //rect(0, 0, 15, 5);
    
    popMatrix();
  }
}
