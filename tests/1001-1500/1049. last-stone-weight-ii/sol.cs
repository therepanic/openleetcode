public class Solution {
    public int LastStoneWeightII(int[] stones) {
        int n = stones.Length;
        int total = 0;
        foreach (int v in stones) total += v;
        int target = total / 2;
        int[] dp_prev = new int[target + 1];
        for (int i = n - 1; i >= 0; i--) {
            int[] dp_curr = new int[target + 1];
            for (int size = 0; size <= target; size++) {
                int skip = dp_prev[size];
                int take = (size >= stones[i]) ? dp_prev[size - stones[i]] + stones[i] : int.MinValue;
                dp_curr[size] = Math.Max(skip, take);
            }
            dp_prev = dp_curr;
        }
        return total - 2 * dp_prev[target];
    }
}
