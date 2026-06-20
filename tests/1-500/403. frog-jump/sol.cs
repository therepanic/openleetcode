public class Solution {
    public bool CanCross(int[] stones) {
        Dictionary<int, HashSet<int>> dp = new Dictionary<int, HashSet<int>>();
        foreach (int stone in stones) {
            dp[stone] = new HashSet<int>();
        }
        dp[0].Add(0);

        foreach (int stone in stones) {
            foreach (int jump in dp[stone]) {
                foreach (int jumpDistance in new int[] {jump - 1, jump, jump + 1}) {
                    if (jumpDistance > 0 && dp.ContainsKey(stone + jumpDistance)) {
                        dp[stone + jumpDistance].Add(jumpDistance);
                    }
                }
            }
        }

        return dp[stones[stones.Length - 1]].Count > 0;
    }
}
