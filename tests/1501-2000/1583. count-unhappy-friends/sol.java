class Solution {
    public int unhappyFriends(int n, int[][] preferences, int[][] pairs) {
        int[] graph = new int[n];
        for (int[] p : pairs) {
            graph[p[0]] = p[1];
            graph[p[1]] = p[0];
        }

        int[][] rank = new int[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n - 1; j++) {
                rank[i][preferences[i][j]] = j;
            }
        }

        int ans = 0;
        for (int u = 0; u < n; u++) {
            int v = graph[u];
            boolean unhappy = false;
            for (int a : preferences[u]) {
                if (a == v) break;
                int av = graph[a];
                if (rank[a][u] < rank[a][av]) {
                    unhappy = true;
                    break;
                }
            }
            if (unhappy) ans++;
        }
        return ans;
    }
}
