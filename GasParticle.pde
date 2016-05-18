public class GasParticle extends Particle {
    /**
     * Construct an in motion gas particle
     *
     * @param p location to spawn gas particle
     */
    public GasParticle(PVector p) {
        super(p);
        vel = new PVector(random(2, 6), random(3, 5));
    }

    /**
     * Render and update model of particle.
     *
     * @return whether particle still alive
     */
    public boolean render() {
        if (!updatePos())
            return false;
        drawParticle();
        return true;
    }

    /**
     * Update position of particle and perform bounds check.
     *
     * @param whether posisiion valid or not
     */
    public boolean updatePos() {
        vel.y += grav;
        pos.add(vel);
        if (pos.x > width || pos.x < 0 || pos.y + radius > c.gasY() || pos.y < 0) {
            c.addGas();
            return false;
        }
        return true;
    }

    /**
     * Draw model of explosion particle.
     */
    protected void drawParticle() {
        noStroke();
        fill(#cc9900);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
        stroke(0);
    }
}
