class Solution {
  int minDeletionSize(List<String> strs) {
    int rows = strs.length;
    int cols = strs[0].length;
    int deletions = 0;

    for (int c = 0; c < cols; c++) {
      for (int r = 0; r < rows - 1; r++) {
        if (strs[r][c].codeUnitAt(0) > strs[r + 1][c].codeUnitAt(0)) {
          deletions++;
          break;
        }
      }
    }

    return deletions;
  }
}
