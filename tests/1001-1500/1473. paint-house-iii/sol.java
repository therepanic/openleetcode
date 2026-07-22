class Solution {
    public int minCost(int[] houses, int[][] cost, int m, int n, int target) {
        int INF = Integer.MAX_VALUE / 2;
        int[][] prev = new int[n][target + 1];
        for (int c = 0; c < n; c++) {
            for (int k = 0; k <= target; k++) {
                prev[c][k] = INF;
            }
        }
        if (houses[0] != 0) {
            int c = houses[0] - 1;
            prev[c][1] = 0;
        } else {
            for (int c = 0; c < n; c++) {
                prev[c][1] = cost[0][c];
            }
        }
        for (int i = 1; i < m; i++) {
            int[][] curr = new int[n][target + 1];
            for (int c = 0; c < n; c++) {
                for (int k = 0; k <= target; k++) {
                    curr[c][k] = INF;
                }
            }
            if (houses[i] != 0) {
                int c = houses[i] - 1;
                int add = 0;
                for (int k = 1; k <= target; k++) {
                    if (prev[c][k] < INF) {
                        if (prev[c][k] + add < curr[c][k]) {
                            curr[c][k] = prev[c][k] + add;
                        }
                    }
                    if (k > 1) {
                        int best = INF;
                        for (int pc = 0; pc < n; pc++) {
                            if (pc != c && prev[pc][k - 1] < best) {
                                best = prev[pc][k - 1];
                            }
                        }
                        if (best < INF && best + add < curr[c][k]) {
                            curr[c][k] = best + add;
                        }
                    }
                }
            } else {
                for (int c = 0; c < n; c++) {
                    int add = cost[i][c];
                    for (int k = 1; k <= target; k++) {
                        if (prev[c][k] < INF) {
                            if (prev[c][k] + add < curr[c][k]) {
                                curr[c][k] = prev[c][k] + add;
                            }
                        }
                        if (k > 1) {
                            int best = INF;
                            for (int pc = 0; pc < n; pc++) {
                                if (pc != c && prev[pc][k - 1] < best) {
                                    best = prev[pc][k - 1];
                                }
                            }
                            if (best < INF && best + add < curr[c][k]) {
                                curr[c][k] = best + add;
                            }
                        }
                    }
                }
            }
            prev = curr;
        }
        int ans = INF;
        for (int c = 0; c < n; c++) {
            if (prev[c][target] < ans) {
                ans = prev[c][target];
            }
        }
        return ans >= INF ? -1 : ans;
    }
}
