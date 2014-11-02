class Shape {
  public PVector position;
  public PVector top_left;
  public PVector bottom_right;
  public int angle;
  
  public Shape(PVector pos, PVector tl, PVector br, int a) {
    position = pos;
    top_left = tl;
    bottom_right = br;
    angle = a;
  }
  
  public void draw() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(angle));
    rect(top_left.x, top_left.y, bottom_right.x, bottom_right.y);
    popMatrix();
  }
  
  public boolean is_collide(Shape shape) {
    return false;
  }
  
  public PVector get_collision_vector(PVector point_position, PVector velocity) {
    return new PVector();
  }
}
