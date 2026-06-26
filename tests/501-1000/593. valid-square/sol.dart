class Solution {
  bool validSquare(List<int> p1, List<int> p2, List<int> p3, List<int> p4) {
    int getDistSq(List<int> pt1, List<int> pt2) {
      return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
             (pt1[1] - pt2[1]) * (pt1[1] - pt2[1]);
    }
    
    List<List<int>> points = [p1, p2, p3, p4];
    Set<int> distances = {};
    
    for (int i = 0; i < 4; i++) {
      for (int j = i + 1; j < 4; j++) {
        distances.add(getDistSq(points[i], points[j]));
      }
    }
    
    return distances.length == 2 && !distances.contains(0);
  }
}
