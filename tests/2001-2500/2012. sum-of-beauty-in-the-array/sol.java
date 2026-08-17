class Solution {
    public int sumOfBeauties(int[] nums) {
        int n = nums.length;
        int[] prefix = new int[n];
        int[] suffix = new int[n];
        prefix[0] = nums[0];
        suffix[n-1] = nums[n-1];
        for (int i = 1; i < n; i++) {
            prefix[i] = Math.max(nums[i-1], prefix[i-1]);
        }
        for (int i = n-2; i >= 0; i--) {
            suffix[i] = Math.min(nums[i+1], suffix[i+1]);
        }
        int ans = 0;
        for (int i = 1; i < n-1; i++) {
            if (prefix[i] < nums[i] && nums[i] < suffix[i]) {
                ans += 2;
            } else if (nums[i-1] < nums[i] && nums[i] < nums[i+1]) {
                ans += 1;
            }
        }
        return ans;
    }
}
