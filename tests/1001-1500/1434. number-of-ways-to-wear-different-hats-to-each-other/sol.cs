public class Solution {
    public int NumberWays(IList<IList<int>> hats) {
        const int MOD = 1_000_000_007;
        int n = hats.Count;
        List<int>[] likedByHat = new List<int>[41];
        for (int i = 1; i <= 40; i++) {
            likedByHat[i] = new List<int>();
        }
        for (int person = 0; person < n; person++) {
            foreach (int hat in hats[person]) {
                likedByHat[hat].Add(person);
            }
        }
        
        int[] dp = new int[1 << n];
        dp[0] = 1;
        for (int hat = 1; hat <= 40; hat++) {
            int[] updated = (int[])dp.Clone();
            for (int mask = 0; mask < (1 << n); mask++) {
                if (dp[mask] == 0) continue;
                foreach (int person in likedByHat[hat]) {
                    int personBit = 1 << person;
                    if ((mask & personBit) == 0) {
                        int target = mask | personBit;
                        updated[target] = (updated[target] + dp[mask]) % MOD;
                    }
                }
            }
            dp = updated;
        }
        return dp[(1 << n) - 1];
    }
}
