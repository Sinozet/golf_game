class Goal {

  Body body;
  float r;
  int c;

  Goal(float _x, float _y, float _r) {
    init(_x, _y, _r);
  }

  Goal(JSONObject json) {
    init(json.getFloat("x"), json.getFloat("y"), json.getFloat("r"));
  }

  void init(float _x, float _y, float _r) {
    r = _r;
    c = 200;

    BodyDef bd = new BodyDef();
    Vec2 center = box2d.coordPixelsToWorld(_x, _y);
    bd.position.set(center);
    bd.type = BodyType.STATIC;

    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    body.createFixture(cs, 1);
    body.setUserData(this);
  }

  void draw() {
    Vec2 pos = getPosition();

    pushMatrix();
    translate(pos.x, pos.y);
    fill(c);
    strokeWeight(0);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }

  Vec2 getPosition() {
    return box2d.getBodyPixelCoord(body);
  }

  JSONObject toJSON() {
    JSONObject json = new JSONObject();
    json.setFloat("x", getPosition().x);
    json.setFloat("y", getPosition().y);
    json.setFloat("r", r);
    return json;
  }
}