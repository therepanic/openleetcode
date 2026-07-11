class Solution {
public:
    int reachableNodes(vector<vector<int>>& edges, int maxMoves, int n) {
        vector<vector<pair<int, int>>> graph(n);
        vector<int> dist(n, maxMoves + 1);
        
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            graph[u].push_back({v, cnt});
            graph[v].push_back({u, cnt});
        }
        
        auto dijkstra = [&]() -> int {
            dist[0] = 0;
            priority_queue<pair<int, int>, vector<pair<int, int>>, greater<>> minHeap;
            minHeap.push({0, 0});
            
            while (!minHeap.empty()) {
                auto [d, u] = minHeap.top();
                minHeap.pop();
                
                if (dist[u] >= maxMoves) break;
                
                for (auto& [v, w] : graph[u]) {
                    int newDist = d + w + 1;
                    if (newDist < dist[v]) {
                        dist[v] = newDist;
                        minHeap.push({newDist, v});
                    }
                }
            }
            
            int count = 0;
            for (int d : dist) {
                if (d <= maxMoves) count++;
            }
            return count;
        };
        
        int reachableNodes = dijkstra();
        int reachableSubnodes = 0;
        
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1], cnt = edge[2];
            int a = dist[u] > maxMoves ? 0 : min(maxMoves - dist[u], cnt);
            int b = dist[v] > maxMoves ? 0 : min(maxMoves - dist[v], cnt);
            reachableSubnodes += min(a + b, cnt);
        }
        
        return reachableNodes + reachableSubnodes;
    }
};
