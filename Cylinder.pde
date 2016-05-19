public class Cylinder {
    private float gasLevel; // 0.0-1.0 proportion of max gas fill level
    private float pistonLevel; // 0.0-1.0 proportion of max piston motion range

    /**
     * Construct cylinder with fully lowered piston, and no gas.
     */
    public Cylinder() {
        gasLevel = 0.0;
        pistonLevel = 0.0;
    }

    /**
     * Render all models within cylinder.
     */
    public void render() {
        drawCylinder();
        drawPiston();
        drawGas();
    }

    /**
     * Render model of cylinder.
     */
    private void drawCylinder() {
        rectMode(CENTER);
        // cylinder body
        fill(#bfbfbf);
        stroke(0);
        rect(width / 2, height / 2, 250, 300);
        rectMode(CORNER);
    }

    /**
     * Render gas according to current gas level.
     */
    private void drawGas() {
        fill(#cc9900, 90);
        rect(width / 2 - 125, pistonY() - 150 * gasLevel, 250, 150 * gasLevel);
    }

    /**
     * Render model of piston.
     */
    private void drawPiston() {
        fill(#999999);
        rect(width / 2 - 125, 450 - 150 * pistonLevel - 25, 250, 25);
    }

    /**
     * Add gas to cylinder if room.
     */
    public void addGas() {
        if (gasY() > topY())
            gasLevel += .005;
    }

    /**
     * Return 0.0-1.0 porportion of max gas fill level.
     *
     * @return 0.0-1.0 proportion of max gas fill level
     */
    public float gasLevel() {
        return gasLevel;
    }

    /**
     * Return Y coordinate of top of piston.
     *
     * @return Y coordinate of top of piston
     */
    public float pistonY() {
        return 450 - 150 * pistonLevel - 25;
    }

    /**
     * Return Y coordinate of top of gas level.
     * 
     * @return Y coordinate of top of gas level
     */
    public float gasY() {
        return pistonY() - 150 * gasLevel;
    }

    /**
     * Return X coordinate of right cylinder wall.
     *
     * @return X coordinate of right cylinder wall
     */
    public int rightWallX() {
        return width / 2 + 125;
    }

    /**
     * Return X coordinate of left cylinder wall.
     *
     * @return X coordinate of left cylinder wall
     */
    public int leftWallX() {
        return width / 2 - 125;
    }

    /**
     * Return Y coordinate of cylinder top.
     *
     * @return Y coordinate of cylinder ceiling.
     */
    public int topY() {
        return height / 2 - 150;
    }
    
    /**
     * Return Y coordinate of cylinder bottom.
     *
     * @return Y coordinate of cylinder floor.
     */
    public int botY() {
        return height / 2 + 150;
    }

    /**
     * Raise piston.
     */
    public void pistonUp() {
        if (gasY() > c.topY())
            pistonLevel += .01;
    }

    /**
     * Lower piston.
     */
    public void pistonDown() {
        if (pistonY() < botY())
            pistonLevel -= .01;
    }
}
