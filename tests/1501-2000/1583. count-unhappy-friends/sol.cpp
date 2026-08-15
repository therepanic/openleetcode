class Solution {
public:
    int unhappyFriends(int n, vector<vector<int>>& preferences, vector<vector<int>>& pairs) {
        vector<int> graph(n);
        for (auto& p : pairs) {
            graph[p[0]] = p[1];
            graph[p[1]] = p[0];
        }

        vector<vector<int>> rank(n, vector<int>(n));
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < preferences[i].size(); j++) {
                rank[i][preferences[i][j]] = j;
            }
        }

        int ans = 0;
        for (int u = 0; u < n; u++) {
            int v = graph[u];
            bool unhappy = false;
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
};
