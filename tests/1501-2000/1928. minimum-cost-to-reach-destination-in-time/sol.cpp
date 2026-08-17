class Solution {
public:
    int minCost(int maxTime, vector<vector<int>>& edges, vector<int>& passingFees) {
        int n = passingFees.size();
        vector<vector<pair<int,int>>> graph(n);
        for (auto& e : edges) {
            graph[e[0]].push_back({e[1], e[2]});
            graph[e[1]].push_back({e[0], e[2]});
        }
        vector<int> times(n, maxTime + 1);
        vector<int> costs(n, INT_MAX);
        times[0] = 0;
        costs[0] = passingFees[0];
        // priority queue: min cost, then min time
        priority_queue<tuple<int,int,int>, vector<tuple<int,int,int>>, greater<tuple<int,int,int>>> pq;
        pq.push({passingFees[0], 0, 0});
        while (!pq.empty()) {
            auto [cost, time, city] = pq.top(); pq.pop();
            if (city == n - 1) return cost;
            for (auto& [nxt, t] : graph[city]) {
                int nt = time + t;
                if (nt > maxTime) continue;
                int nc = cost + passingFees[nxt];
                if (nc < costs[nxt] || nt < times[nxt]) {
                    costs[nxt] = nc;
                    times[nxt] = nt;
                    pq.push({nc, nt, nxt});
                }
            }
        }
        return -1;
    }
};
