#include <vector>
#include <queue>
#include <climits>
using namespace std;

class Solution {
public:
    int findCheapestPrice(int n, vector<vector<int>>& flights, int src, int dst, int k) {
        vector<vector<pair<int, int>>> matrix(n);
        for (auto& flight : flights) {
            int u = flight[0], v = flight[1], w = flight[2];
            matrix[u].emplace_back(v, w);
        }

        vector<int> distance(n, INT_MAX);
        distance[src] = 0;

        queue<pair<int, int>> q;
        q.push({src, 0});
        int steps = 0;

        while (!q.empty()) {
            int level = q.size();
            if (steps == k + 1) {
                break;
            }
            steps++;

            for (int i = 0; i < level; i++) {
                auto [node, dist] = q.front(); q.pop();
                for (auto& [v, w] : matrix[node]) {
                    if (w + dist < distance[v]) {
                        distance[v] = w + dist;
                        q.push({v, dist + w});
                    }
                }
            }
        }

        return distance[dst] == INT_MAX ? -1 : distance[dst];
    }
};
