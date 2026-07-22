class Solution {
  int longestSubarray(List<int> nums) {
    int left = 0, zeros = 0, res = 0;
    for (int right = 0; right < nums.length; right++) {
      if (nums[right] == 0) zeros++;
      while (zeros > 1) {
        if (nums[left] == 0) zeros--;
        left++;
      }
      if (right - left > res) res = right - left;
    }
    return res;
  }
}
