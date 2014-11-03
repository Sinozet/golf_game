import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Ball ball;
Map  level_map;
Goal goal;
Vec2 ball_init_pos;
float ball_init_r; 
Vec2 press;
Vec2 release;

boolean save_level = false;
String level_name;
LevelLoader ll;

boolean show_win = false;

void moveBallOnStart() {
  ball.killBody();
  ball = new Ball(ball_init_pos.x, ball_init_pos.y, ball_init_r);
  ball.body.setLinearVelocity(new Vec2(-5.2, 0));
  ball.body.setAngularVelocity(5);
}

void setup() {
  size(640,360);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0, 0);

  ll = new LevelLoader("levels/1.json");
  ll.load();
  ball          = ll.ball;
  ball_init_pos = ball.getPosition();
  ball_init_r   = ball.r;
  level_map     = ll.level_map;
  level_name    = ll.name;
  goal          = ll.goal;

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
  goal.draw();

  if (press != null) {
    Vec2 arrow_start = ball.getPosition();
    Vec2 arrow_end   = new Vec2();
    pushMatrix();
    translate(arrow_start.x, arrow_start.y);
    line(0, 0, mouseX - press.x , mouseY - press.y);
    popMatrix();
  }

  if (show_win) {
    textSize(32);
    fill(0, 102, 153);
    text("You win!", width/2 - 50, 100);
  }
}

void mousePressed() {
  show_win = false;
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
  show_win = false;
  if (key == 'r' || key == 'R') {
    moveBallOnStart();
  } else if (key == 'e' || key == 'E') {
    println("ball position: "+ball.getPosition());
    println("goal position: "+goal.getPosition());
  }
}

void beginContact(Contact cp) {
  Object a = cp.getFixtureA().getBody().getUserData();
  Object b = cp.getFixtureA().getBody().getUserData();

  if (a == null || b == null) {
    return;
  }

  Class a_class = a.getClass();
  Class b_class = b.getClass();

  println("a class: ", a_class);
  println("b class: ", b_class);

  boolean has_ball = a_class == Ball.class || b_class == Ball.class;
  boolean has_goal = a_class == Goal.class || b_class == Goal.class;

  // TODO: In reality collide two Ball classes - I don't know why
  if (has_ball && has_goal || a_class == Ball.class && b_class == Ball.class) {
    show_win = true;
  }
}

void endContact(Contact cp) {
}

void nextLevel() {

}