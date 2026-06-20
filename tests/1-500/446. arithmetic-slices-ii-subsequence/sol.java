import java.util.HashMap;
import java.util.Map;

class Solution {
    @SuppressWarnings("unchecked")
    public int numberOfArithmeticSlices(int[] nums) {
        int n = nums.length;
        int totalCount = 0;
        Map<Long, Integer>[] dp = (Map<Long, Integer>[]) new Map[n];
        for (int i = 0; i < n; i++) {
            dp[i] = new HashMap<>();
        }

        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                long diff = (long) nums[i] - nums[j];
                dp[i].put(diff, dp[i].getOrDefault(diff, 0) + 1);
                if (dp[j].containsKey(diff)) {
                    int count = dp[j].get(diff);
                    dp[i].put(diff, dp[i].get(diff) + count);
                    totalCount += count;
                }
            }
        }

        return totalCount;
    }
}
