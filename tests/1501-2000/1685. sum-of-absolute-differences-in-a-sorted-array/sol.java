class Solution {
    public int[] getSumAbsoluteDifferences(int[] nums) {
        int n = nums.length;
        int[] pref = new int[n];
        pref[0] = nums[0];
        for (int i = 1; i < n; i++) pref[i] = pref[i-1] + nums[i];
        int[] ans = new int[n];
        for (int i = 0; i < n; i++) {
            int left = i > 0 ? pref[i-1] : 0;
            int right = pref[n-1] - pref[i];
            ans[i] = right - left + (2*i - n + 1) * nums[i];
        }
        return ans;
    }
}
