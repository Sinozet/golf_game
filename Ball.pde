class Ball {
  public Shape shape;
  public PVector velocity;
  
  public Ball(Shape s, PVector v) {
    shape = s;
    velocity = v;
  }
  
  public void draw() {
    shape.draw();
  }
  
  public void move() {
    shape.position.add(velocity);
  }
}
