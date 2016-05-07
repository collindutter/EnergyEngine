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
        c.addGas();
    }
    text(frameRate, 20, 20);
}
