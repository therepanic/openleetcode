class Solution {
  int maxFrequency(List<int> nums, int k) {
    nums.sort();
    int left = 0;
    int right = 0;
    int res = 0;
    int total = 0;

    while (right < nums.length) {
      total += nums[right];

      while (nums[right] * (right - left + 1) > total + k) {
        total -= nums[left];
        left++;
      }
      
      res = (right - left + 1) > res ? (right - left + 1) : res;
      right++;
    }
    
    return res;
  }
}
