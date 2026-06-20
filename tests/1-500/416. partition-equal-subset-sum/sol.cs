public class Solution {
    public bool CanPartition(int[] nums) {
        int totalSum = 0;
        foreach (int num in nums) totalSum += num;
        if (totalSum % 2 != 0) return false;
        int targetSum = totalSum / 2;
        bool[] dp = new bool[targetSum + 1];
        dp[0] = true;
        foreach (int num in nums) {
            for (int currSum = targetSum; currSum >= num; currSum--) {
                dp[currSum] = dp[currSum] || dp[currSum - num];
            }
        }
        return dp[targetSum];
    }
}
