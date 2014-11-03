class Map {

  Body body;
  ArrayList<Wall> walls;

  Map(ArrayList<Wall> _walls) {
    walls = _walls;
  }

  Map(JSONObject json) {
    ArrayList<Wall> _walls = new ArrayList<Wall>();
    JSONArray json_walls = json.getJSONArray("walls");
    for (int i = 0; i < json_walls.size(); i++) {
      JSONObject json_wall = json_walls.getJSONObject(i);
      _walls.add(new Wall(json_wall));
    }

    walls = _walls;
  }

  void draw() {
    for (Wall wall : walls) {
      wall.draw();
    }
  }

  JSONObject toJSON() {
    JSONObject json = new JSONObject();
    JSONArray json_walls = new JSONArray();

    for (int i = 0; i < walls.size(); i++) {
      JSONObject json_v = walls.get(i).toJSON();
      json_walls.setJSONObject(i, json_v);
    }

    json.setJSONArray("walls", json_walls);
    return json;
  }
}