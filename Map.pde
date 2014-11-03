class Map {

  Body body;
  ArrayList<Wall> walls;

  Map(ArrayList<Wall> _walls) {
    walls = _walls;
  }

  void draw() {
    for (Wall wall : walls) {
      wall.draw();
    }
  }
}