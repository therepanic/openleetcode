class Solution {
  int minElements(List<int> nums, int limit, int goal) {
    int currentSum = nums.reduce((a, b) => a + b);
    int diff = (goal - currentSum).abs();
    return (diff + limit - 1) ~/ limit;
  }
}
