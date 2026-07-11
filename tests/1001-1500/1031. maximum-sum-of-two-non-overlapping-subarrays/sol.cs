public class Solution {
    public int MaxSumTwoNoOverlap(int[] nums, int firstLen, int secondLen) {
        return System.Math.Max(Solve(nums, firstLen, secondLen), Solve(nums, secondLen, firstLen));
    }

    private int Solve(int[] nums, int firstLen, int secondLen) {
        int n = nums.Length;
        int[] prefix = new int[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i + 1] = prefix[i] + nums[i];
        }
        int bestA = prefix[firstLen];
        int ans = 0;
        for (int end = firstLen + secondLen; end <= n; end++) {
            bestA = System.Math.Max(bestA, prefix[end - secondLen] - prefix[end - secondLen - firstLen]);
            ans = System.Math.Max(ans, bestA + prefix[end] - prefix[end - secondLen]);
        }
        return ans;
    }
}
