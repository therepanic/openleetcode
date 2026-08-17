class Solution {
public:
    int countRestrictedPaths(int n, vector<vector<int>>& edges) {
        const int MOD = 1'000'000'007;
        vector<vector<pair<int, int>>> graph(n + 1);
        for (auto& e : edges) {
            graph[e[0]].push_back({e[1], e[2]});
            graph[e[1]].push_back({e[0], e[2]});
        }

        const long long INF = 1e18;
        vector<long long> dist(n + 1, INF);
        dist[n] = 0;
        priority_queue<pair<long long, int>, vector<pair<long long, int>>, greater<>> pq;
        pq.push({0, n});
        while (!pq.empty()) {
            auto [d, node] = pq.top(); pq.pop();
            if (d > dist[node]) continue;
            for (auto& [next, w] : graph[node]) {
                long long nd = d + w;
                if (nd < dist[next]) {
                    dist[next] = nd;
                    pq.push({nd, next});
                }
            }
        }

        vector<long long> dp(n + 1, 0);
        dp[n] = 1;
        vector<int> nodes(n);
        iota(nodes.begin(), nodes.end(), 1);
        sort(nodes.begin(), nodes.end(), [&](int a, int b) {
            return dist[a] < dist[b];
        });
        for (int u : nodes) {
            for (auto& [v, w] : graph[u]) {
                if (dist[u] > dist[v]) {
                    dp[u] = (dp[u] + dp[v]) % MOD;
                }
            }
        }
        return (int)(dp[1] % MOD);
    }
};
