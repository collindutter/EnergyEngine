public class Cylinder {
    private float gasLevel; 

    public Cylinder() {
        gasLevel = 0.0;
    }

    public void render() {
        drawCylinder();
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
        fill(#cc9900, 129);
        rect(width / 2 - 125, 450 - 150 * gasLevel, 250, 150 * (gasLevel));
    }

    public void addGas() {
        gasLevel += .001;
    }
}
