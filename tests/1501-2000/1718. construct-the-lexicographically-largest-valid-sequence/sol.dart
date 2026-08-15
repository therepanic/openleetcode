class Solution {
  List<int> constructDistancedSequence(int n) {
    final result = List<int>.filled(2 * n - 1, 0);
    final used = List<bool>.filled(n + 1, false);
    backtrack(result, used, n, 0);
    return result;
  }

  bool backtrack(List<int> result, List<bool> used, int n, int index) {
    var idx = index;
    while (idx < result.length && result[idx] != 0) {
      idx++;
    }
    if (idx == result.length) return true;

    for (var i = n; i >= 1; i--) {
      if (used[i]) continue;

      if (i == 1) {
        result[idx] = 1;
        used[1] = true;
        if (backtrack(result, used, n, idx + 1)) return true;
        result[idx] = 0;
        used[1] = false;
      } else if (idx + i < result.length && result[idx + i] == 0) {
        result[idx] = i;
        result[idx + i] = i;
        used[i] = true;
        if (backtrack(result, used, n, idx + 1)) return true;
        result[idx] = 0;
        result[idx + i] = 0;
        used[i] = false;
      }
    }

    return false;
  }
}
