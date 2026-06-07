class Solution {
  List<List<int>> permute(List<int> nums) {
    final res = <List<int>>[];

    void backtrack(int i) {
      if (i == nums.length) {
        res.add(List<int>.from(nums));
        return;
      }

      for (var j = i; j < nums.length; j++) {
        final tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
        backtrack(i + 1);
        nums[j] = nums[i];
        nums[i] = tmp;
      }
    }

    backtrack(0);
    return res;
  }
}
