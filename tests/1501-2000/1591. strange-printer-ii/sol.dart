class Solution {
  bool isPrintable(List<List<int>> targetGrid) {
    int m = targetGrid.length;
    int n = targetGrid[0].length;
    Map<int, List<List<int>>> colors = {};
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        colors.putIfAbsent(targetGrid[i][j], () => []).add([i, j]);
      }
    }
    
    bool canRemove(int color) {
      var pos = colors[color]!;
      int mnR = pos[0][0], mxR = pos[0][0];
      int mnC = pos[0][1], mxC = pos[0][1];
      for (var p in pos) {
        if (p[0] < mnR) mnR = p[0];
        if (p[0] > mxR) mxR = p[0];
        if (p[1] < mnC) mnC = p[1];
        if (p[1] > mxC) mxC = p[1];
      }
      for (int i = mnR; i <= mxR; i++) {
        for (int j = mnC; j <= mxC; j++) {
          if (targetGrid[i][j] != color && targetGrid[i][j] > 0) return false;
        }
      }
      for (int i = mnR; i <= mxR; i++) {
        for (int j = mnC; j <= mxC; j++) {
          targetGrid[i][j] = 0;
        }
      }
      return true;
    }
    
    Set<int> colorSet = colors.keys.toSet();
    while (colorSet.isNotEmpty) {
      Set<int> removable = colorSet.where((c) => canRemove(c)).toSet();
      if (removable.isEmpty) return false;
      colorSet.removeAll(removable);
    }
    return true;
  }
}
