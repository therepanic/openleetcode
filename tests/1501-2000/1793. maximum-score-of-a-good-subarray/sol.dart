class Solution {
  int maximumScore(List<int> nums, int k) {
    int n = nums.length;
    int i = k, j = k;
    int curMin = nums[k];
    int res = curMin;

    while (i > 0 || j < n - 1) {
      if (i == 0) {
        j++;
      } else if (j == n - 1) {
        i--;
      } else if (nums[i - 1] >= nums[j + 1]) {
        i--;
      } else {
        j++;
      }
      curMin = [curMin, nums[i], nums[j]].reduce((a, b) => a < b ? a : b);
      res = [res, curMin * (j - i + 1)].reduce((a, b) => a > b ? a : b);
    }

    return res;
  }
}
