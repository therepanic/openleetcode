class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    int r = isWater.length;
    int c = isWater[0].length;
    List<List<int>> height = List.generate(r, (_) => List.filled(c, 1 << 30));

    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        if (isWater[i][j] == 1) {
          height[i][j] = 0;
        } else {
          if (i > 0) height[i][j] = (height[i][j] < height[i - 1][j] + 1) ? height[i][j] : height[i - 1][j] + 1;
          if (j > 0) height[i][j] = (height[i][j] < height[i][j - 1] + 1) ? height[i][j] : height[i][j - 1] + 1;
        }
      }
    }

    for (int i = r - 1; i >= 0; i--) {
      for (int j = c - 1; j >= 0; j--) {
        if (i < r - 1) height[i][j] = (height[i][j] < height[i + 1][j] + 1) ? height[i][j] : height[i + 1][j] + 1;
        if (j < c - 1) height[i][j] = (height[i][j] < height[i][j + 1] + 1) ? height[i][j] : height[i][j + 1] + 1;
      }
    }

    return height;
  }
}
