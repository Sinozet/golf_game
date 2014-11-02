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
}
