public abstract class Particle {
    protected PVector pos; // position of particle
    protected PVector vel; // velocity of particle
    protected static final float grav = .2; // gravity constant to apply to particle
    protected int radius; // radius at which to draw particle

    /**
     * Construct a particle.
     *
     * @param p position at which to form the particle
     */
    public Particle(PVector p) {
        pos = p; 
        radius = 5;
    }

    /**
     * Draw model of particle.
     */
    protected abstract void drawParticle();

    /**
     * Render and update model of particle.
     *
     * @return whether particle still alive
     */
    public abstract boolean render();

}
