class Ball {

  Body body;
  float r;
  int c;

  Ball(float _x, float _y, float _r) {
    init(_x, _y, _r);
  }

  Ball(JSONObject json) {
    init(json.getFloat("x"), json.getFloat("y"), json.getFloat("r"));
  }

  Ball(Ball b) {
    Vec2 b_pos = b.getPosition();
    init(b_pos.x, b_pos.y, b.r);
  }

  void init(float _x, float _y, float _r) {
    r = _r;
    c = 150;

    BodyDef bd = new BodyDef();
    Vec2 center = box2d.coordPixelsToWorld(_x, _y);
    bd.position.set(center);
    bd.type = BodyType.DYNAMIC;
    bd.linearDamping = 0.8;
    bd.angularDamping = 0.9;
    bd.bullet = true;

    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    fd.density = 1.0;

    body.createFixture(fd);
    body.setUserData(this);
  }

  void draw() {
    Vec2 pos = getPosition();
    float a  = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(c);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    line(0, 0, r, 0);
    popMatrix();
  }

  Vec2 getPosition() {
    return box2d.getBodyPixelCoord(body);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  JSONObject toJSON() {
    JSONObject json = new JSONObject();
    json.setFloat("x", getPosition().x);
    json.setFloat("y", getPosition().y);
    json.setFloat("r", r);
    return json;
  }
}