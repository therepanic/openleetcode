class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final seen = <int, int>{};
    for (var i = 0; i < nums.length; i++) {
      final need = target - nums[i];
      final j = seen[need];
      if (j != null) {
        return [j, i];
      }
      seen[nums[i]] = i;
    }
    return <int>[];
  }
}
