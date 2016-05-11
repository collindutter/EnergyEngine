public class GasParticle extends Particle {
    public GasParticle(PVector p) {
        super(p);
        vel = new PVector(random(2, 6), random(3, 5));
    }

    public boolean render() {
        if (!updatePos())
            return false;
        drawParticle();
        return true;
    }

    public boolean updatePos() {
        vel.add(grav);
        pos.add(vel);
        if (pos.x > width || pos.x < 0 || pos.y + radius > c.gasY() || pos.y < 0) {
            c.addGas();
            return false;
        }
        return true;
    }

    protected void drawParticle() {
        noStroke();
        fill(#cc9900);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
        stroke(0);
    }
}
