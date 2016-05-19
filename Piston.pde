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
        rect(pos.x, pos.y, 250, 25);
        rectMode(CORNER);
    }
}
