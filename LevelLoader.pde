class LevelLoader {
  String filepath;
  String name;
  Ball ball;
  Map level_map;
  Goal goal;

  LevelLoader(String _filepath) {
    filepath = _filepath;
  }

  void load() {
    JSONObject json = loadJSONObject(filepath);
    name      = json.getString("name");
    ball      = new Ball(json.getJSONObject("ball"));
    level_map = new Map(json.getJSONObject("map"));
    goal      = new Goal(json.getJSONObject("goal"));
  }

  void save() {
    JSONObject json = new JSONObject();
    json.setString("name", name);
    json.setJSONObject("ball", ball.toJSON());
    json.setJSONObject("map",  level_map.toJSON());
    json.setJSONObject("goal", goal.toJSON());
    saveJSONObject(json, filepath);
  }
}