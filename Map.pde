class Map {

  Body body;
  int c;
  float w;
  float h;
  float a;

  Map() {
    c = 150;
    w = 100;
    h = 50;
    a = 0;

    BodyDef bd = new BodyDef();
    Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);

    bd.position.set(center);
    bd.type = BodyType.STATIC;

    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w);
    float box2Dh = box2d.scalarPixelsToWorld(h);
    ps.setAsBox(box2Dw/2, box2Dh/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    fd.density = 10.0;

    body.createFixture(fd);
  }

  void draw() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a  = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    translate(-w/2, -h/2);
    rotate(a);
    fill(c);
    stroke(0);
    strokeWeight(1);
    rect(0, 0, w, h);
    popMatrix();
  }
}