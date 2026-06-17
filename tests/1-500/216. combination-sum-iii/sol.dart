class Solution {
  List<List<int>> combinationSum3(int k, int n) {
    List<List<int>> res = [];
    void backtrack(int start, List<int> path, int target, int k) {
      if (target == 0 && k == 0) {
        res.add(List.from(path));
        return;
      }
      for (int i = start; i <= 9; i++) {
        if (i > target || k <= 0) break;
        path.add(i);
        backtrack(i + 1, path, target - i, k - 1);
        path.removeLast();
      }
    }
    backtrack(1, [], n, k);
    return res;
  }
}
