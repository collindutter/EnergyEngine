public class Magnifier {
    private PVector pos;
    private static final int RADIUS = 50;
    
    public Magnifier() {
        pos = new PVector(mouseX, mouseY);
    }

    public void render() {
        pos.x = mouseX;
        pos.y = mouseY;
        drawMagnifierWindow();
    }

    private boolean inCylinder() {
        return pos.x + RADIUS > c.leftWallX() && pos.x - RADIUS < c.rightWallX()
            && pos.y - RADIUS < c.botY() && pos.y + RADIUS > c.topY();
    }

    private void drawMagnifierWindow() {
        noFill();
        ellipse(pos.x, pos.y, RADIUS * 2, RADIUS * 2);
    }

}
