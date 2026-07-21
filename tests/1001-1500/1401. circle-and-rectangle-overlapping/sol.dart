class Solution {
  bool checkOverlap(int radius, int xCenter, int yCenter, int x1, int y1, int x2, int y2) {
    int nearestX = [x1, [x2, xCenter].reduce((a, b) => a < b ? a : b)].reduce((a, b) => a > b ? a : b);
    int nearestY = [y1, [y2, yCenter].reduce((a, b) => a < b ? a : b)].reduce((a, b) => a > b ? a : b);
    int dist = (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter);
    return dist <= radius * radius;
  }
}
