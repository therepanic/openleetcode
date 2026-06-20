class Solution {
  bool isRectangleCover(List<List<int>> rectangles) {
    int area = 0;
    Set<String> corners = {};
    
    for (var rect in rectangles) {
      int x = rect[0], y = rect[1], X = rect[2], Y = rect[3];
      area += (X - x) * (Y - y);
      
      String p1 = '$x,$y';
      String p2 = '$x,$Y';
      String p3 = '$X,$y';
      String p4 = '$X,$Y';
      
      if (!corners.add(p1)) corners.remove(p1);
      if (!corners.add(p2)) corners.remove(p2);
      if (!corners.add(p3)) corners.remove(p3);
      if (!corners.add(p4)) corners.remove(p4);
    }
    
    if (corners.length != 4) return false;
    
    int minX = 1 << 60, minY = 1 << 60;
    int maxX = -(1 << 60), maxY = -(1 << 60);
    
    for (var point in corners) {
      var parts = point.split(',');
      int x = int.parse(parts[0]);
      int y = int.parse(parts[1]);
      if (x < minX) minX = x;
      if (y < minY) minY = y;
      if (x > maxX) maxX = x;
      if (y > maxY) maxY = y;
    }
    
    return (maxX - minX) * (maxY - minY) == area;
  }
}
