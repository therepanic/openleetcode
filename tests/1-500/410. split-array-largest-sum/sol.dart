class Solution {
  bool _helper(List<int> nums, int perK, int k) {
    int count = 1;
    int currSum = 0;
    for (int num in nums) {
      if (currSum + num > perK) {
        count++;
        currSum = num;
      } else {
        currSum += num;
      }
    }
    return count <= k;
  }

  int splitArray(List<int> nums, int k) {
    int high = nums.reduce((a, b) => a + b);
    int low = nums.reduce((a, b) => a > b ? a : b);
    int soln = 0;
    while (low <= high) {
      int mid = low + (high - low) ~/ 2;
      if (_helper(nums, mid, k)) {
        soln = mid;
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
    return soln;
  }
}
