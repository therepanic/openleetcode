class Solution {
    public int[] sumEvenAfterQueries(int[] nums, int[][] queries) {
        int total = 0;
        for (int x : nums) {
            if (x % 2 == 0) total += x;
        }
        int[] ans = new int[queries.length];
        for (int i = 0; i < queries.length; i++) {
            int val = queries[i][0];
            int idx = queries[i][1];
            if (nums[idx] % 2 == 0) total -= nums[idx];
            nums[idx] += val;
            if (nums[idx] % 2 == 0) total += nums[idx];
            ans[i] = total;
        }
        return ans;
    }
}
