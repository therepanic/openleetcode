class Solution {
  int movesToMakeZigzag(List<int> nums) {
    int n = nums.length;
    return [findValleys(nums, 0), findValleys(nums, 1)].reduce((a, b) => a < b ? a : b);
  }

  int findValleys(List<int> nums, int mode) {
    int res = 0;
    int n = nums.length;
    for (int i = 0; i < n; i++) {
      if (i % 2 == mode) {
        int left = i - 1 >= 0 ? nums[i - 1] : 0x7FFFFFFFFFFFFFFF;
        int right = i + 1 < n ? nums[i + 1] : 0x7FFFFFFFFFFFFFFF;
        int minNeighbor = left < right ? left : right;
        if (nums[i] >= minNeighbor) {
          res += nums[i] - (minNeighbor - 1);
        }
      }
    }
    return res;
  }
}
