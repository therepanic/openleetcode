public class Solution {
    public double GetProbability(int[] balls) {
        int sm = 0;
        foreach (int b in balls) sm += b;

        int half = sm / 2;
        long[,] choose = new long[49, 49];
        for (int n = 0; n <= 48; n++) {
            choose[n, 0] = choose[n, n] = 1;
            for (int k = 1; k < n; k++) {
                choose[n, k] = choose[n - 1, k - 1] + choose[n - 1, k];
            }
        }

        var memo = new Dictionary<(int color, int used, int distinct0, int distinct1), long>();
        long dp(int color, int used, int distinct0, int distinct1) {
            if (used > half) return 0;
            var key = (color, used, distinct0, distinct1);
            if (memo.TryGetValue(key, out long cached)) return cached;
            if (color == balls.Length) {
                long result = used == half && distinct0 == distinct1 ? 1 : 0;
                memo[key] = result;
                return result;
            }

            long resultForState = 0;
            for (int first = 0; first <= balls[color]; first++) {
                resultForState += choose[balls[color], first] *
                                  dp(color + 1, used + first,
                                     distinct0 + (first > 0 ? 1 : 0),
                                     distinct1 + (first < balls[color] ? 1 : 0));
            }
            memo[key] = resultForState;
            return resultForState;
        }

        long favorable = dp(0, 0, 0, 0);
        long total = choose[sm, half];
        return (double)favorable / total;
    }
}
