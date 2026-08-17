public class Solution {
    public int UnhappyFriends(int n, int[][] preferences, int[][] pairs) {
        int[] graph = new int[n];
        foreach (var p in pairs) {
            graph[p[0]] = p[1];
            graph[p[1]] = p[0];
        }

        int[][] rank = new int[n][];
        for (int i = 0; i < n; i++) {
            rank[i] = new int[n];
            for (int j = 0; j < preferences[i].Length; j++) {
                rank[i][preferences[i][j]] = j;
            }
        }

        int ans = 0;
        for (int u = 0; u < n; u++) {
            int v = graph[u];
            bool unhappy = false;
            foreach (int a in preferences[u]) {
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
