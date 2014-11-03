import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Ball ball;
Map  level_map;
Vec2 press;
Vec2 release;

void createBall() {
  ball = new Ball(width/2, height/2  - 200, 10);
  ball.body.setLinearVelocity(new Vec2(-5.2, 0));
  ball.body.setAngularVelocity(5);
}

void setup() {
  size(640,360);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  createBall();
  level_map = new Map();
}

void draw() {
  background(255);
  box2d.step();

  ball.draw();
  level_map.draw();

  if (press != null) {
    Vec2 arrow_start = ball.getPosition();
    Vec2 arrow_end   = new Vec2();
    pushMatrix();
    translate(arrow_start.x, arrow_start.y);
    line(0, 0, mouseX - press.x , mouseY - press.y);
    popMatrix();
  }
}

void mousePressed() {
  press = new Vec2(mouseX, mouseY);
}

void mouseReleased() {
  release = new Vec2(mouseX, mouseY);
  ball.body.setLinearVelocity(press.sub(release));
  press = null;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    createBall();
  }
}