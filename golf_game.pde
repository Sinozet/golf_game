import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Ball ball;
Ball init_ball;
Map  level_map;
Vec2 press;
Vec2 release;

boolean save_level = false;
String level_name;
LevelLoader ll;

void createBall() {
  ball = new Ball(init_ball);
  ball.body.setLinearVelocity(new Vec2(-5.2, 0));
  ball.body.setAngularVelocity(5);
}

void setup() {
  size(640,360);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  ll = new LevelLoader("levels/1.json");
  ll.load();
  init_ball = ll.ball;
  level_map = ll.level_map;
  level_name = ll.name;

  createBall();

  if (save_level) {
    ll = new LevelLoader("levels/1.json");
    ll.name = "first level";
    ll.ball = ball;
    ll.level_map = level_map;
    ll.save();
  }
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
  Vec2 velocity = press.sub(release);
  velocity.y = -velocity.y;
  ball.body.setLinearVelocity(velocity);
  press = null;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    createBall();
  }
}