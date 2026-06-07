class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();
    final used = List<bool>.filled(nums.length, false);
    final path = <int>[];
    final res = <List<int>>[];

    void backtrack() {
      if (path.length == nums.length) {
        res.add(List<int>.from(path));
        return;
      }

      for (var i = 0; i < nums.length; i++) {
        if (used[i]) {
          continue;
        }
        if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) {
          continue;
        }
        used[i] = true;
        path.add(nums[i]);
        backtrack();
        path.removeLast();
        used[i] = false;
      }
    }

    backtrack();
    return res;
  }
}
