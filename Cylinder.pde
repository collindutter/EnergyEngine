public class Cylinder {
    private float gasLevel; 
    private float pistonLevel;

    public Cylinder() {
        gasLevel = 0.0;
        pistonLevel = 0.0;
    }

    public void render() {
        drawCylinder();
        drawPiston();
        drawGas();
    }

    private void drawCylinder() {
        rectMode(CENTER);
        // cylinder body
        fill(#bfbfbf);
        stroke(0);
        rect(width / 2, height / 2, 250, 300);
        rectMode(CORNER);
    }

    private void drawGas() {
        fill(#cc9900, 90);
        rect(width / 2 - 125, pistonY() - 150 * gasLevel, 250, 150 * gasLevel);
    }

    private void drawPiston() {
        fill(#999999);
        rect(width / 2 - 125, 450 - 150 * pistonLevel - 25, 250, 25);
    }

    public void addGas() {
        if (gasY() > topY())
            gasLevel += .005;
    }

    public float gasLevel() {
        return gasLevel;
    }

    public float pistonY() {
        return 450 - 150 * pistonLevel - 25;
    }

    public float gasY() {
        return pistonY() - 150 * gasLevel;
    }

    public int rightWallX() {
        return width / 2 + 125;
    }
    
    public int leftWallX() {
        return width / 2 - 125;
    }

    public int topY() {
        return height / 2 - 150;
    }
    
    public int botY() {
        return height / 2 + 150;
    }

    public void pistonUp() {
        if (gasY() > c.topY())
            pistonLevel += .01;
    }

    public void pistonDown() {
        if (pistonY() < botY())
            pistonLevel -= .01;
    }
}
