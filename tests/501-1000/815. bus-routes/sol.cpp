class Solution {
public:
    int numBusesToDestination(vector<vector<int>>& routes, int source, int target) {
        if (source == target) return 0;
        unordered_map<int, unordered_set<int>> adj;
        for (int bus = 0; bus < routes.size(); bus++) {
            for (int location : routes[bus]) {
                adj[location].insert(bus);
            }
        }
        queue<int> q;
        for (int bus : adj[target]) {
            q.push(bus);
        }
        int cost = 0;
        unordered_set<int> visited;
        while (!q.empty()) {
            cost++;
            int size = q.size();
            for (int i = 0; i < size; i++) {
                int node = q.front();
                q.pop();
                visited.insert(node);
                for (int location : routes[node]) {
                    if (location == source) return cost;
                }
                for (int location : routes[node]) {
                    for (int bus : adj[location]) {
                        if (visited.find(bus) == visited.end()) {
                            q.push(bus);
                        }
                    }
                }
            }
        }
        return -1;
    }
};
