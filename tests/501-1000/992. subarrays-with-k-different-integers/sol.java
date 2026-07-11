class Solution {
    public int subarraysWithKDistinct(int[] nums, int k) {
        return atMost(nums, k) - atMost(nums, k - 1);
    }

    private int atMost(int[] nums, int k) {
        java.util.Map<Integer, Integer> freq = new java.util.HashMap<>();
        int count = 0;
        int left = 0;
        int n = nums.length;

        for (int right = 0; right < n; right++) {
            freq.put(nums[right], freq.getOrDefault(nums[right], 0) + 1);

            while (freq.size() > k) {
                if (freq.get(nums[left]) > 1) {
                    freq.put(nums[left], freq.get(nums[left]) - 1);
                } else {
                    freq.remove(nums[left]);
                }
                left++;
            }

            count += (right - left + 1);
        }

        return count;
    }
}
