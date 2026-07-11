class Solution {
  int minDominoRotations(List<int> tops, List<int> bottoms) {
    int n = tops.length;
    int res = double.maxFinite.toInt();
    List<int> face = List.filled(7, 0);
    for (int i = 0; i < n; i++) {
      face[tops[i]]++;
      if (bottoms[i] != tops[i]) {
        face[bottoms[i]]++;
      }
    }
    for (int x = 1; x <= 6; x++) {
      if (face[x] < n) {
        continue;
      }
      int maintainTop = 0;
      int maintainBottom = 0;
      bool possible = true;
      for (int i = 0; i < n; i++) {
        if (tops[i] != x) {
          maintainTop++;
        }
        if (bottoms[i] != x) {
          maintainBottom++;
        }
      }
      if (possible) {
        int minVal = maintainTop < maintainBottom ? maintainTop : maintainBottom;
        if (minVal < res) {
          res = minVal;
        }
      }
    }
    return res == double.maxFinite.toInt() ? -1 : res;
  }
}
