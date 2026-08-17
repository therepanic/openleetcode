public class Solution {
    public int MaxResult(int[] nums, int k) {
        int n = nums.Length;
        int[] dp = new int[n];
        dp[0] = nums[0];
        var dq = new LinkedList<int>();
        dq.AddLast(0);
        for (int i = 1; i < n; i++) {
            while (dq.Count > 0 && dq.First.Value < i - k) {
                dq.RemoveFirst();
            }
            dp[i] = nums[i] + dp[dq.First.Value];
            while (dq.Count > 0 && dp[dq.Last.Value] <= dp[i]) {
                dq.RemoveLast();
            }
            dq.AddLast(i);
        }
        return dp[n-1];
    }
}
