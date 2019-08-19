# Introduction to Processing & Simple Particle Systems

### Materials

- laptop
- [Processing Desktop Application](https://processing.org/download/)

### Resources

- [Processing Reference](https://processing.org/reference/)
- [The Coding Train on Youtube](https://www.youtube.com/user/shiffman)
- [ColorHexa](https://www.colorhexa.com/)

### What is Processing?

Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts.
It uses the coding language **Java** as a base, and adds on tons of functionality, making it easier to draw, input and output files, and many other things that designers can use.
Processing exists as part of a family of libraries and platforms, such as **p5.js**. Syntax differs between platforms, but the logic systems we use
with one language can always be transferred to the other environments.

### Object Oriented Programming

OOP is a programming paradigm based on the concept of **objects**, which can contain data (often known as **attributes** or **properties**), and code (often known in this context as **methods**).
An object is an abstracted section of computer memory, which programmers use to organize data and often times to simplify code. The programming langauge Java is based around the concept of objects.

### Basics

- `setup()` runs once when we start the animation. This is where we set up the canvas, and, ideally, perform the majority of our calculations.
- `draw()`  runs once for every single frame that the animation runs. This is where we draw all of our elements.

- **Classes** are the blueprints used to create **Objects**. We can write our own classes with custom attributes and methods.
- **Attributes** are the data contained inside objects.
- **Methods** are the functions that objects know how to perform on their attributes.

- `PVector()` is an object in Processing which is essentially a list that is commonly used to store coordinate values. [reference](https://processing.org/reference/PVector.html)
- `ArrayList()` is also a list object, but is more flexible, and can be modified to store different types of data... or other objects. [reference](https://processing.org/reference/ArrayList.html)

### Main File

The main file is the base of our Processing sketch. In it, we write the `setup()` and `draw()` functions, which run the animation. Often at the top of the main file, we will also declare any global variables we want, which are accessible by any function in our sketch.

```processing
// declaration of global variables
int population = 50;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
    // set up canvas
    size(800,800);

    // populate the list "particles" with particle objects
    for (int i = 0; i < population; i++) {
        particles.add(new Particle());
    }
}
```
In this case, our global variables are a population number, which dictates how many particles we want to create, and an ArrayList object `particles` that is set up to contain Particle objects, which we will create later.
The `setup()` function decides the size of our canvas, and populates the list `particles` with new Particle objects.

The `draw()` function simply interates through the list `particles` and calls the `update()` and `display()` methods that each particle comes with.
`draw()` runs once on every frame of the animation, so this means that on each frame, each particle in `particles` is going to update its position, and display itself on the canvas.

```processing
void draw() {
    background(0);
    fill(255);

    // update physics system and display each particle
    for (int i = 0; i < population; i++) {
    particles.get(i).update();
    particles.get(i).display();
    }
}
```

### Particles

Lets look at the bare bones of a Particle class.

```processing
class Particle {
    // attributes
    PVector position = new PVector();
    PVector velocity = new PVector();
    PVector acceleration = new PVector();
```

Here, position, velocity, and acceleration are attributes of the class that we have created, called `Particle`. Each particle we create will store its own version of those attributes, but for now, they will have nothing in them. They are empty PVectors.
To give the particles original locations and velocities, we are going to write what is called a constructor function. All objects have a constructor function, and it runs once, whenever an instance of that object is created.

```processing
    // constructor function
    Particle() {
        position.x = random(width);
        position.y = random(height);
        velocity = PVector.random2D();
    }
```

### Methods

Now that we have a template for data our particle will hold, we want it to be able to do things - namely move around on its own. To do this, we write methods.

```processing
    // methods
    void update() {
        velocity.add(acceleration);
        position.add(velocity);
        acceleration.mult(0);
    }
    void display() {
        translate(pos.x, pos.y);
        fill(255);
        ellipse(0,0,10,10);
    }
}
```

The `update()` method implements the physics system of our animation, updating the particle's velocity, position, and acceleration values. The `display()` function just draws a circle at a particle's current position.

### Wrap-up

All together these few lines of code make use of OOP and Processing to create an animation of circular particles moving around a screen. A full version of this Processing sketch is downloadable on this page.
It contains extra functionality that adds gravity, makes the balls bounce off the edges of the screen, and lets the user move a paddle around to interact with the particles. Download it and play with the code!

