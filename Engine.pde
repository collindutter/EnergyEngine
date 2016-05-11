ArrayList<Particle> particles;
Cylinder c;
void setup() {
    size(800, 600);
    init();
}

void init() {
    c = new Cylinder();
    particles = new ArrayList<Particle>();
}

void draw() {
    background(255);

    c.render();
    for (int ndx = 0; ndx < particles.size(); ndx++)
        if (!particles.get(ndx).render())
            particles.remove(ndx--);

    if (mousePressed) {
        particles.add(new GasParticle(new PVector(275, 150)));
    }
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
    for (int ndx = 0; ndx < 50; ndx++) {
        particles.add(new ExplosionParticle(new PVector(width / 2 + random(-10, 10), (c.gasY() + c.pistonY()) / 2)));
    }
}
