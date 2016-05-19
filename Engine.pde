ArrayList<Particle> particles;
Cylinder c;
Magnifier mag;
void setup() {
    size(800, 600);
    init();
}

void init() {
    c = new Cylinder();
    particles = new ArrayList<Particle>();
    mag = new Magnifier();
}

void draw() {
    background(255);

    c.render();
    for (int ndx = 0; ndx < particles.size(); ndx++)
        if (!particles.get(ndx).render())
            particles.remove(ndx--);

    if (mousePressed)
        particles.add(new GasParticle(new PVector(c.leftWallX(), c.topY())));
    mag.render();
    text(frameRate, 20, 20);
}

void keyPressed(KeyEvent e) {
    if (key == 'r')
        init();
    if (key == 'f')
        explode();
    if (keyCode == UP)
        c.pistonUp();
    if (keyCode == DOWN)
        c.pistonDown();
}

void explode() {
    for (int ndx = 0; ndx < 100; ndx++) {
        particles.add(new ExplosionParticle(new PVector(c.pos.x + random(-10, 10), c.topY() + 10)));
    }
}
