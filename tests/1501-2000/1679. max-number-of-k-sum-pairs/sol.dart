class Solution {
  int maxOperations(List<int> nums, int k) {
    nums.sort();
    var left = 0;
    var right = nums.length - 1;
    var result = 0;
    while (left < right) {
      final sum = nums[left] + nums[right];
      if (sum == k) {
        result++;
        left++;
        right--;
      } else if (sum < k) {
        left++;
      } else {
        right--;
      }
    }
    return result;
  }
}
