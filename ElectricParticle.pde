public class ElectricParticle extends Particle {
    private float life; // falls from 1.0 to 0.0 as the explosion particle dies
    private color fillColor; // explosion particle fill color

    /**
     * Construct a new explosion particle with random 360 degree velocity.
     *
     * @param p location to spawn gas particle
     */
    public ElectricParticle(PVector p)  {
        super(p);
        vel = new PVector(random(-2, 2), random(-2, 2));
        life = 1.0;
        if (random(0, 1) > .2)
            fillColor = color(255, 230, random(45, 90));
        else
            fillColor = color(255, 255, 255);
    }

    /**
     * Render and update model of explosion particle.
     */
    public boolean render() {
        updatePos();
        if (life <= 0)
            return false;
        life -= .05;
        drawParticle();

        if (pos.y + radius >= c.pistonY())
            c.pistonDown();
        return true;
    }

    /**
     * Update position of particle and perform bounds check.
     */
    private void updatePos() {
        pos.add(vel);
        if (pos.x + radius >= c.rightWallX() || pos.x - radius <= c.leftWallX())
            vel.x = -vel.x;
        if (pos.y + 2 * radius >= c.pistonY() || pos.y - radius <= c.topY())
            vel.y = -vel.y;
    }
        
    /**
     * Draw model of explosion particle.
     */
    protected void drawParticle() {
        noStroke();
        fill(fillColor, 255 * life);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
        stroke(0);
    }
}
