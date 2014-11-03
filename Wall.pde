class Wall {

  Body body;
  ArrayList<Vec2> vertices;
  int c;

  Wall(ArrayList<Vec2> _vertices) {
    vertices = _vertices;
    c = 150;

    BodyDef bd = new BodyDef();
    Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);
    bd.position.set(center);
    bd.type = BodyType.STATIC;

    body = box2d.createBody(bd);
    
    Vec2[] world_vertices = new Vec2[vertices.size()];

    for (int i = 0; i < world_vertices.length; i++) {
      world_vertices[i] = box2d.coordPixelsToWorld(vertices.get(i));
    }

    ChainShape chain = new ChainShape();
    chain.createLoop(world_vertices, world_vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    fd.density = 10.0;

    body.createFixture(fd);
  }

  void draw() {
    strokeWeight(1);
    stroke(0);
    fill(c);

    beginShape();
    for (Vec2 v: vertices) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}