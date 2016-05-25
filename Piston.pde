public class Piston {
    private PVector pos;
    private PVector vel;
    public float pistonLevel;

    public Piston(PVector p) {
        pos = p;
        pistonLevel = 0;
        vel = new PVector(0, -.3);
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
        float x = 50 * cos(2 * PI * pistonLevel);
        float y = 50 * sin(2 * PI * pistonLevel);
        line(pos.x, pistonY() + 175, 500 + x, 500 + y);
    }
    
    public void pistonUp() {
        if (c.gasY() >= c.topY() + 1 && pistonY() + 173 >= c.botY())
            pistonLevel += -vel.y;
    }

    public void pistonDown() {
        if (pistonY() < c.botY() - 25)
            pistonLevel += vel.y;
    }

    public float pistonY() {
        return pos.y - 100.0 * pistonLevel;
    }

    public float pistonTopY() {
        return pistonY() - 25 / 2.0;
    }

}
