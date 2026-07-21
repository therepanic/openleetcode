class Solution {
public:
    int minTime(int n, vector<vector<int>>& edges, vector<bool>& hasApple) {
        vector<vector<int>> adj(n);
        vector<int> degree(n, 0);

        for (auto& e : edges) {
            int u = e[0], v = e[1];
            adj[u].push_back(v);
            adj[v].push_back(u);
            degree[u]++;
            degree[v]++;
        }

        queue<int> q;
        for (int i = 1; i < n; i++) {
            if (degree[i] == 1 && !hasApple[i]) {
                q.push(i);
            }
        }

        vector<bool> keep(n, true);

        while (!q.empty()) {
            int u = q.front();
            q.pop();
            keep[u] = false;

            for (int v : adj[u]) {
                degree[v]--;
                if (v != 0 && keep[v] && !hasApple[v] && degree[v] == 1) {
                    q.push(v);
                }
            }
        }

        int activeNodes = 0;
        for (bool k : keep) {
            if (k) activeNodes++;
        }

        return max(0, (activeNodes - 1) * 2);
    }
};
