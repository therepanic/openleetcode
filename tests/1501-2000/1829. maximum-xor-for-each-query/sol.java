class Solution {
    public int[] getMaximumXor(int[] nums, int maximumBit) {
        int n = nums.length;
        int[] ans = new int[n];
        int mask = (1 << maximumBit) - 1;
        int curr = 0;
        for (int i = 0; i < n; i++) {
            curr ^= nums[i];
            ans[n - 1 - i] = mask ^ curr;
        }
        return ans;
    }
}
