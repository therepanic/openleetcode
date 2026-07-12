class Solution {
  int minDeletionSize(List<String> strs) {
    int n = strs.length;
    int m = strs[0].length;
    List<bool> sortedPairs = List.filled(n - 1, false);
    int delCount = 0;

    for (int col = 0; col < m; col++) {
      bool bad = false;
      for (int i = 0; i < n - 1; i++) {
        if (!sortedPairs[i] && strs[i][col].codeUnitAt(0) > strs[i + 1][col].codeUnitAt(0)) {
          bad = true;
          break;
        }
      }

      if (bad) {
        delCount++;
        continue;
      }

      for (int i = 0; i < n - 1; i++) {
        if (!sortedPairs[i] && strs[i][col].codeUnitAt(0) < strs[i + 1][col].codeUnitAt(0)) {
          sortedPairs[i] = true;
        }
      }

      if (sortedPairs.every((b) => b)) break;
    }

    return delCount;
  }
}
