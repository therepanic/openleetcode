class Solution {
    public int maximumUniqueSubarray(int[] nums) {
        int res = 0;
        int cur_sum = 0;
        int start = 0;
        int k = 10001;
        boolean[] is_present = new boolean[k];

        for (int end = 0; end < nums.length; end++) {
            while (is_present[nums[end]]) {
                is_present[nums[start]] = false;
                cur_sum -= nums[start];
                start++;
            }

            is_present[nums[end]] = true;
            cur_sum += nums[end];

            res = Math.max(res, cur_sum);
        }

        return res;
    }
}
