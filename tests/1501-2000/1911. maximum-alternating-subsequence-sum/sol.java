class Solution {

    public long maxAlternatingSum(int[] nums) {
        long even = 0;
        long odd = 0;
        for (int value : nums) {
            long nextEven = Math.max(even, odd + value);
            long nextOdd = Math.max(odd, even - value);
            even = nextEven;
            odd = nextOdd;
        }
        return even;

    }

    private long solve(int idx, int flag, int[] nums, int n, long[][] memo) {

        if (idx >= n) return 0;

        if (memo[idx][flag] != -1) return memo[idx][flag];

        long skip = solve(idx+1, flag, nums, n, memo);

        long val = nums[idx];

        if (flag == 0) val = -val;

        long take = val + solve(idx+1, 1 - flag, nums, n, memo);

        memo[idx][flag] = Math.max(skip, take);

        return memo[idx][flag];

    }

}
