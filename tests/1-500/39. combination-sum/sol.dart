class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    candidates.sort();
    final res = <List<int>>[];
    final cur = <int>[];

    void backtrack(int start, int total) {
      if (total == target) {
        res.add(List<int>.from(cur));
        return;
      }

      for (var i = start; i < candidates.length; i++) {
        if (total + candidates[i] > target) {
          break;
        }
        cur.add(candidates[i]);
        backtrack(i, total + candidates[i]);
        cur.removeLast();
      }
    }

    backtrack(0, 0);
    return res;
  }
}
