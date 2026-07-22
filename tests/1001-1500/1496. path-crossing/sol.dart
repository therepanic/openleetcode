class Solution {
  bool isPathCrossing(String path) {
    var set = <String>{};
    int x = 0, y = 0;
    set.add("0,0");
    for (var c in path.split('')) {
      if (c == 'N') y++;
      else if (c == 'S') y--;
      else if (c == 'E') x++;
      else if (c == 'W') x--;
      String point = "$x,$y";
      if (set.contains(point)) return true;
      set.add(point);
    }
    return false;
  }
}
