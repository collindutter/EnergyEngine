// TODO Add spark
// TODO Add subanimation
// TODO Add mechanical motion
// TODO Better explosion
// TODO Add spark button, fuel button
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

    if (mousePressed && c.fuelButtonClicked(new PVector(mouseX, mouseY)))
        particles.add(new GasParticle(new PVector(c.leftWallX() + 1.5, c.topY() + 5)));
    mag.render();
}

void keyPressed(KeyEvent e) {
    if (key == 'r')
        init();
    if (key == 'f')
        c.ignite();
    if (keyCode == UP)
        c.pistonUp();
    if (keyCode == DOWN)
        c.pistonDown();
}

void mousePressed() {
    PVector m = new PVector(mouseX, mouseY);

    if (c.sparkButtonClicked(m))
        c.ignite();
}
