import java.util.*;

Ball ball;
Map  map;
ArrayList<Shape> map_shapes;
ArrayList<int[]> shapes_definition;

void setup() {
  size(640, 360);
  background(230);
  fill(50);
  //rect(0, 0, 10, 10);
  map_shapes = new ArrayList();
  shapes_definition = new ArrayList();
  
  int first_wall[] = {0, 0, 10, 10, 20, 20};
  shapes_definition.add(first_wall);
  
  for (int ms[] : shapes_definition) {
    map_shapes.add(new Shape(
      new PVector(ms[0], ms[1]), 
      new PVector(ms[2], ms[3]),
      new PVector(ms[4], ms[5]),
      0
      )
    );
  }
  map = new Map(map_shapes);
}

void draw() {
  map.draw();
}
