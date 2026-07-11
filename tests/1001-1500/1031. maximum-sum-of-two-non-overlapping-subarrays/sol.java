class Solution {
    public int maxSumTwoNoOverlap(int[] nums, int firstLen, int secondLen) {
        return Math.max(solve(nums, firstLen, secondLen), solve(nums, secondLen, firstLen));
    }

    private int solve(int[] nums, int firstLen, int secondLen) {
        int n = nums.length;
        int[] prefix = new int[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        int bestA = prefix[firstLen];
        int ans = 0;
        for (int end = firstLen + secondLen; end <= n; end++) {
            bestA = Math.max(bestA, prefix[end - secondLen] - prefix[end - secondLen - firstLen]);
            ans = Math.max(ans, bestA + prefix[end] - prefix[end - secondLen]);
        }
        return ans;
    }
}
