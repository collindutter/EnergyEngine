public abstract class Particle {
    protected PVector pos;
    protected PVector vel;
    protected PVector grav;
    protected int radius;

    public Particle(PVector p) {
        pos = p; 
        radius = 5;
        grav = new PVector(0, .2);
    }
    protected abstract void drawParticle();

    public abstract boolean render();

}
