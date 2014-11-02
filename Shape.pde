class Shape {
  public PVector position;
  public PVector top_left;
  public PVector bottom_right;
  public double angle;
  
  public Shape(PVector pos, PVector tl, PVector br, double a) {
    position = pos;
    top_left = tl;
    bottom_right = br;
    angle = a;
  }
  
  public void draw() {
    rect(top_left.x, top_left.y, bottom_right.x, bottom_right.y);
  }
  
  public boolean is_collide(Shape shape) {
    return false;
  }
}
