class Solution {
  List<int> mostCompetitive(List<int> nums, int k) {
    List<int> stack = [];
    int n = nums.length;
    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && stack.last > nums[i]) {
        if (n - 1 - i >= k - stack.length) {
          stack.removeLast();
        } else {
          break;
        }
      }
      stack.add(nums[i]);
    }
    return stack.sublist(0, k);
  }
}
