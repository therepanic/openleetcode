#include <queue>
#include <vector>
#include <unordered_map>
#include <cmath>

class Solution {
public:
    int minCostConnectPoints(vector<vector<int>>& points) {
        int n = points.size();
        int minCost = 0;
        vector<bool> visited(n, false);
        priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
        pq.push({0, 0});
        unordered_map<int, int> cache;
        cache[0] = 0;
        
        while (!pq.empty()) {
            auto [cost, u] = pq.top(); pq.pop();
            if (visited[u]) continue;
            visited[u] = true;
            minCost += cost;
            for (int v = 0; v < n; v++) {
                if (!visited[v]) {
                    int dist = abs(points[u][0] - points[v][0]) + abs(points[u][1] - points[v][1]);
                    if (dist < (cache.count(v) ? cache[v] : INT_MAX)) {
                        cache[v] = dist;
                        pq.push({dist, v});
                    }
                }
            }
        }
        return minCost;
    }
};
