class Solution {
  int findMaxConsecutiveOnes(List<int> nums) {
    int res = 0;
    int left = 0;
    for (int right = 0; right < nums.length; right++) {
      if (nums[right] == 0) {
        left = right + 1;
      } else {
        res = res > (right - left + 1) ? res : (right - left + 1);
      }
    }
    return res;
  }
}
