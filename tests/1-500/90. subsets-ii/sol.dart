class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort();
    final res = <List<int>>[];
    final cur = <int>[];
    void dfs(int start) {
      res.add(List<int>.from(cur));
      for (var i = start; i < nums.length; i++) {
        if (i > start && nums[i] == nums[i - 1]) continue;
        cur.add(nums[i]);
        dfs(i + 1);
        cur.removeLast();
      }
    }
    dfs(0);
    return res;
  }
}
