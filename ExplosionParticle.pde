public class ExplosionParticle extends Particle {
    private float life;
    private color fillColor;

    public ExplosionParticle(PVector p)  {
        super(p);
        vel = new PVector(random(-5, 5), random(-5, 5));
        life = 1.0;
        fillColor = color(255, random(128, 255), 0);
    }

    public boolean render() {
        if (!updatePos())
            return false;
        if (life <= 0)
            return false;
        life -= .01;
        drawParticle();
        return true;
    }


    public boolean updatePos() {
        pos.add(vel);
        if (pos.x + radius >= c.rightWallX() || pos.x - radius <= c.leftWallX())
            vel.x = -vel.x;
        if (pos.y + radius >= c.pistonY() || pos.y - radius <= c.topY())
            vel.y = -vel.y;
        return true;
    }
        
    public void drawParticle() {
        noStroke();
        fill(fillColor, 255 * life);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
        stroke(0);
    }
}
