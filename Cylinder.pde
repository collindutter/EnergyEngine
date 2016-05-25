public class Cylinder {
    private float gasLevel; // 0.0-1.0 proportion of max gas fill level
    private float gasOpacity;
    private float pistonLevel; // 0.0-1.0 proportion of max piston motion range
    private Piston p;
    private PVector pos;
    private boolean ignit;
    private boolean sparkButtonPressed;
    private long sparkButtonPressedTime;
    private boolean fuelButtonPressed;

    /**
     * Construct cylinder with fully lowered piston, and no gas.
     */
    public Cylinder() {
        gasLevel = 0.0;
        pistonLevel = 0.0;
        gasOpacity = 80;
        ignit = false;
        sparkButtonPressed = false;
        sparkButtonPressedTime = millis();
        fuelButtonPressed = false;
        pos = new PVector(width / 4, height / 3);
        p = new Piston(new PVector(pos.x, botY() - 25));
    }

    /**
     * Render all models within cylinder.
     */
    public void render() {
        //println(gasLevel, gasOpacity);
        if (ignit && gasLevel > 0 && gasOpacity > 0) {
            gasLevel -= .05;
            gasOpacity -= .05;
        }
        if (gasLevel <= 0 || gasOpacity <= 0) {
            gasLevel = 0;
            ignit = false;
        }

        if (millis() - sparkButtonPressedTime > 200)
            sparkButtonPressed = false;
        drawCylinder();
        drawSparkButton();
        drawGasFunnel();
        drawGas();
        p.render();
    }

    /**
     * Render model of cylinder.
     */
    private void drawCylinder() {
        rectMode(CENTER);
        // cylinder body
        stroke(0);
        fill(#bfbfbf);
        rect(pos.x, pos.y, 250, 300);
        rectMode(CORNER);
    }

    private void drawSparkButton() {
        if (!sparkButtonPressed) {
            rectMode(CENTER);
            fill(#ff0000);
            stroke(0);
            rect(pos.x, topY() - 10, 50, 20);
            rectMode(CORNER);
        }
        else {
            rectMode(CENTER);
            fill(#ff0000);
            stroke(0);
            rect(pos.x, topY() - 5, 50, 10);
            rectMode(CORNER);
        }
    }

    private void drawGasFunnel() {
        rectMode(CENTER);
        fill(#bfbfbf);
        stroke(0);
        rect(leftWallX() - 25, topY() + 7.5, 50, 15);
        if (!fuelButtonPressed) {
            fill(#ff0000);
            rect(leftWallX() - 25, topY() + 22.5, 30, 15);
        }
        else {
            fill(#ff0000);
            rect(leftWallX() - 25, topY() + 19, 30, 7.5);
        }
        rectMode(CORNER);
        fill(#bfbfbf);
        rect(leftWallX() - 50, -5, 15, topY() + 5);
    }

    public boolean fuelButtonClicked(PVector p) {
        if (p.x > leftWallX() - 50 && p.x < leftWallX() && p.y > topY() + 15 && p.y < topY() + 30) {
            fuelButtonPressed = true;
            return true;
        }
        return false;
    }

    /**
     * Render gas according to current gas level.
     */
    private void drawGas() {
        fill(#cc9900, gasOpacity);
        rect(pos.x - 125, pistonY() - 100 * gasLevel, 250, 100 * gasLevel);
    }

    /**
     * Render model of piston.
     */
    private void drawPiston() {
        fill(#999999);
        rect(pos.x - 125, botY() - 150 * pistonLevel - 25, 250, 25);
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
        return p.pistonY();
    }

    /**
     * Return Y coordinate of top of gas level.
     * 
     * @return Y coordinate of top of gas level
     */
    public float gasY() {
        return pistonY() - 100 * gasLevel;
    }

    /**
     * Return X coordinate of right cylinder wall.
     *
     * @return X coordinate of right cylinder wall
     */
    public float rightWallX() {
        return pos.x + 125;
    }

    /**
     * Return X coordinate of left cylinder wall.
     *
     * @return X coordinate of left cylinder wall
     */
    public float leftWallX() {
        return pos.x - 125;
    }

    /**
     * Return Y coordinate of cylinder top.
     *
     * @return Y coordinate of cylinder ceiling.
     */
    public float topY() {
        return pos.y - 150;
    }
    
    /**
     * Return Y coordinate of cylinder bottom.
     *
     * @return Y coordinate of cylinder floor.
     */
    public float botY() {
        return pos.y + 150;
    }

    /**
     * Raise piston.
     */
    public void pistonUp() {
        p.pistonUp();
    }

    /**
     * Lower piston.
     */
    public void pistonDown() {
        p.pistonDown();
    }

    public void ignite() {
        for (int ndx = 0; ndx < 200 * c.gasLevel(); ndx++)
            particles.add(new ExplosionParticle(new PVector(c.pos.x + random(-10, 10), c.topY() + 3)));
        for (int ndx = 0; ndx < 50; ndx++)
            particles.add(new ElectricParticle(new PVector(c.pos.x, c.topY() + 4)));
        ignit = true;
    }

    public boolean sparkButtonClicked(PVector p) {
        if (p.x > pos.x - 25 && p.x < pos.x + 25 && p.y > topY() - 20 && p.y < topY()) {
            sparkButtonPressed = true;
            sparkButtonPressedTime = millis();
            return true;
        }
        return false;
    }
}
