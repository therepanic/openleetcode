public class Solution {

    public long MaxAlternatingSum(int[] nums) {

        int n = nums.Length;

        long[,] memo = new long[n+1, 2];

        for (int i = 0; i <= n; i++) {

            memo[i, 0] = -1;

            memo[i, 1] = -1;

        }

        return Solve(0, 1, nums, n, memo);

    }

    private long Solve(int idx, int flag, int[] nums, int n, long[,] memo) {

        if (idx >= n) {

            return 0;

        }

        if (memo[idx, flag] != -1) {

            return memo[idx, flag];

        }

        long skip = Solve(idx+1, flag, nums, n, memo);

        long val = nums[idx];

        if (flag == 0) {

            val = -val;

        }

        long take = val + Solve(idx+1, 1 - flag, nums, n, memo);

        memo[idx, flag] = Math.Max(skip, take);

        return memo[idx, flag];

    }

}
