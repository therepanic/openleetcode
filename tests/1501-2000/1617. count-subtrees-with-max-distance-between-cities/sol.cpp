class Solution {
public:
    vector<int> countSubgraphsForEachDiameter(int n, vector<vector<int>>& edges) {
        vector<vector<int>> graph(n);
        for (auto& e : edges) {
            int u = e[0] - 1, v = e[1] - 1;
            graph[u].push_back(v);
            graph[v].push_back(u);
        }
        vector<int> answer(n - 1, 0);
        for (int mask = 1; mask < (1 << n); ++mask) {
            if (__builtin_popcount(mask) <= 1) continue;
            int b = mask & -mask;
            int s = __builtin_ctz(b);
            vector<bool> seen(n, false);
            seen[s] = true;
            int cnt = 1;
            queue<int> q;
            q.push(s);
            while (!q.empty()) {
                int u = q.front();
                q.pop();
                for (int v : graph[u]) {
                    if ((mask >> v) & 1 && !seen[v]) {
                        seen[v] = true;
                        cnt++;
                        q.push(v);
                    }
                }
            }
            if (cnt != __builtin_popcount(mask)) continue;
            auto bfs = [&](int start) -> pair<int, int> {
                vector<int> dist(n, -1);
                dist[start] = 0;
                queue<int> q;
                q.push(start);
                int last = start;
                while (!q.empty()) {
                    int u = q.front();
                    q.pop();
                    last = u;
                    for (int v : graph[u]) {
                        if ((mask >> v) & 1 && dist[v] == -1) {
                            dist[v] = dist[u] + 1;
                            q.push(v);
                        }
                    }
                }
                return {last, dist[last]};
            };
            auto [a, _] = bfs(s);
            auto [b2, d] = bfs(a);
            if (d >= 1) answer[d - 1]++;
        }
        return answer;
    }
};
