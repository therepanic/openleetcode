class Solution {
  int subarraysWithKDistinct(List<int> nums, int k) {
    int atMost(int k) {
      Map<int, int> freq = {};
      int count = 0;
      int left = 0;
      int n = nums.length;

      for (int right = 0; right < n; right++) {
        freq[nums[right]] = (freq[nums[right]] ?? 0) + 1;

        while (freq.length > k) {
          if (freq[nums[left]]! > 1) {
            freq[nums[left]] = freq[nums[left]]! - 1;
          } else {
            freq.remove(nums[left]);
          }
          left++;
        }

        count += (right - left + 1);
      }

      return count;
    }

    return atMost(k) - atMost(k - 1);
  }
}
