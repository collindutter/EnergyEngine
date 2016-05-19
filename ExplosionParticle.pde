public class ExplosionParticle extends Particle {
    private float life; // falls from 1.0 to 0.0 as the explosion particle dies
    private color fillColor; // explosion particle fill color

    /**
     * Construct a new explosion particle with random 360 degree velocity.
     *
     * @param p location to spawn gas particle
     */
    public ExplosionParticle(PVector p)  {
        super(p);
        vel = new PVector(random(-3, 3), random(-10, 10));
        life = 1.0;
        fillColor = color(255, random(128, 255), 0);
    }

    /**
     * Render and update model of explosion particle.
     */
    public boolean render() {
        updatePos();
        if (life <= 0)
            return false;
        life -= .01;
        drawParticle();

        if (pos.y > c.pistonY())
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
        if (pos.y + radius >= c.pistonY() || pos.y - radius <= c.topY())
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
