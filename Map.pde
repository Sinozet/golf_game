class Map {
  public ArrayList<Shape> shapes;
  
  public Map(ArrayList<Shape> s) {
    shapes = s;    
  }
  
  public void draw() {
    for(Shape shape : shapes){
      shape.draw();
    }
  }
  
  public boolean is_collide(Shape s) {
    for (Shape map_shape : shapes) {
      if (s.is_collide(map_shape)) {
        return true;
      }
    }
    return false;
  }
}
