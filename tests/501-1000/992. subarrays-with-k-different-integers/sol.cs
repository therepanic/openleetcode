public class Solution {
    public int SubarraysWithKDistinct(int[] nums, int k) {
        int AtMost(int k) {
            var freq = new Dictionary<int, int>();
            int count = 0;
            int left = 0;
            int n = nums.Length;

            for (int right = 0; right < n; right++) {
                if (freq.ContainsKey(nums[right])) {
                    freq[nums[right]]++;
                } else {
                    freq[nums[right]] = 1;
                }

                while (freq.Count > k) {
                    if (freq[nums[left]] > 1) {
                        freq[nums[left]]--;
                    } else {
                        freq.Remove(nums[left]);
                    }
                    left++;
                }

                count += (right - left + 1);
            }

            return count;
        }

        return AtMost(k) - AtMost(k - 1);
    }
}
