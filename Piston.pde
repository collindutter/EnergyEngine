public class Piston {
    private PVector pos;
    public float pistonLevel;

    public Piston(PVector p) {
        pos = p;
        pistonLevel = 0;
    }

    public void render() {
        drawPiston();
    }

    /**
     * Render model of piston.
     */
    private void drawPiston() {
        fill(#999999);
        rectMode(CENTER);
        rect(pos.x, pistonY() + 25 / 2.0, 250, 25);
        rect(pos.x, pistonY() + 75 + 25, 25, 150);
        rectMode(CORNER);
    }
    
    public void pistonUp() {
        if (c.gasY() > c.topY() && pistonY() >= c.botY() - 25 - 150)
            pistonLevel += .03;
    }

    public void pistonDown() {
        if (pistonY() < c.botY() - 25)
            pistonLevel -= .03;
    }

    public float pistonY() {
        return pos.y - 100 * pistonLevel;
    }

}
