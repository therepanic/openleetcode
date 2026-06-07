class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    nums.sort();
    final res = <List<int>>[];
    for (var i = 0; i + 3 < nums.length; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;
      for (var j = i + 1; j + 2 < nums.length; j++) {
        if (j > i + 1 && nums[j] == nums[j - 1]) continue;
        var l = j + 1;
        var r = nums.length - 1;
        while (l < r) {
          final sum = nums[i] + nums[j] + nums[l] + nums[r];
          if (sum == target) {
            res.add([nums[i], nums[j], nums[l], nums[r]]);
            l++;
            r--;
            while (l < r && nums[l] == nums[l - 1]) l++;
            while (l < r && nums[r] == nums[r + 1]) r--;
          } else if (sum < target) {
            l++;
          } else {
            r--;
          }
        }
      }
    }
    return res;
  }
}
