class Solution {
    public double getProbability(int[] balls) {
        int colors = balls.length;
        int total = 0;
        for (int count : balls) total += count;
        int half = total / 2;

        long[][][] dp = new long[half + 1][colors + 1][colors + 1];
        dp[0][0][0] = 1;

        for (int count : balls) {
            long[][][] next = new long[half + 1][colors + 1][colors + 1];
            for (int used = 0; used <= half; used++) {
                for (int left = 0; left <= colors; left++) {
                    for (int right = 0; right <= colors; right++) {
                        long ways = dp[used][left][right];
                        if (ways == 0) continue;
                        for (int inLeft = 0; inLeft <= count && used + inLeft <= half; inLeft++) {
                            int nextLeft = left + (inLeft > 0 ? 1 : 0);
                            int nextRight = right + (inLeft < count ? 1 : 0);
                            next[used + inLeft][nextLeft][nextRight] +=
                                ways * choose(count, inLeft);
                        }
                    }
                }
            }
            dp = next;
        }

        long favorable = 0;
        for (int distinct = 0; distinct <= colors; distinct++) {
            favorable += dp[half][distinct][distinct];
        }
        return (double) favorable / choose(total, half);
    }

    private long choose(int n, int k) {
        if (k > n - k) k = n - k;
        long result = 1;
        for (int i = 1; i <= k; i++) {
            result = result * (n - k + i) / i;
        }
        return result;
    }
}
