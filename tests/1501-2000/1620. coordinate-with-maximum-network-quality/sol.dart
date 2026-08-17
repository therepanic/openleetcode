class Solution {
  List<int> bestCoordinate(List<List<int>> towers, int radius) {
    int maxX = 0;
    int maxY = 0;
    for (var t in towers) {
      if (t[0] > maxX) maxX = t[0];
      if (t[1] > maxY) maxY = t[1];
    }
    
    int bestQuality = 0;
    List<int> bestCoord = [0, 0];
    
    for (int x = 0; x <= maxX; x++) {
      for (int y = 0; y <= maxY; y++) {
        int quality = 0;
        for (var t in towers) {
          double dist = sqrt(pow(t[0] - x, 2) + pow(t[1] - y, 2));
          if (dist <= radius) {
            quality += (t[2] / (1 + dist)).toInt();
          }
        }
        if (quality > bestQuality || (quality == bestQuality && (x < bestCoord[0] || (x == bestCoord[0] && y < bestCoord[1])))) {
          bestQuality = quality;
          bestCoord[0] = x;
          bestCoord[1] = y;
        }
      }
    }
    
    return bestCoord;
  }
}
