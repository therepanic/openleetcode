class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    final res = <List<int>>[];
    final cur = <int>[];

    void backtrack(int start, int total) {
      if (total == target) {
        res.add(List<int>.from(cur));
        return;
      }

      var prev = -1;
      for (var i = start; i < candidates.length; i++) {
        if (i > start && candidates[i] == prev) {
          continue;
        }
        if (total + candidates[i] > target) {
          break;
        }
        cur.add(candidates[i]);
        backtrack(i + 1, total + candidates[i]);
        cur.removeLast();
        prev = candidates[i];
      }
    }

    backtrack(0, 0);
    return res;
  }
}
