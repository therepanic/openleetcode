class Solution {
public:
    vector<int> sortItems(int n, int m, vector<int>& group, vector<vector<int>>& beforeItems) {
        unordered_map<int, unordered_set<int>> groupToItems;
        int newGroup = m;
        for (int i = 0; i < n; i++) {
            if (group[i] == -1) group[i] = newGroup++;
            groupToItems[group[i]].insert(i);
        }

        unordered_map<int, unordered_set<int>> intraPred, intraSucc;
        unordered_map<int, unordered_set<int>> interPred, interSucc;

        for (int i = 0; i < n; i++) {
            for (int before : beforeItems[i]) {
                if (group[i] == group[before]) {
                    intraPred[i].insert(before);
                    intraSucc[before].insert(i);
                } else {
                    interPred[group[i]].insert(group[before]);
                    interSucc[group[before]].insert(group[i]);
                }
            }
        }

        auto topologicalSort = [](vector<int> nodes, 
                                  unordered_map<int, unordered_set<int>>& pred, 
                                  unordered_map<int, unordered_set<int>>& succ) -> vector<int> {
            vector<int> order;
            queue<int> q;
            for (int node : nodes) {
                if (pred[node].empty()) q.push(node);
            }
            while (!q.empty()) {
                int node = q.front(); q.pop();
                order.push_back(node);
                for (int s : succ[node]) {
                    pred[s].erase(node);
                    if (pred[s].empty()) q.push(s);
                }
            }
            return order.size() == nodes.size() ? order : vector<int>();
        };

        vector<int> groupNodes;
        for (auto& p : groupToItems) groupNodes.push_back(p.first);
        auto groupsOrder = topologicalSort(groupNodes, interPred, interSucc);
        if (groupsOrder.empty()) return {};

        vector<int> result;
        for (int grp : groupsOrder) {
            vector<int> items(groupToItems[grp].begin(), groupToItems[grp].end());
            auto order = topologicalSort(items, intraPred, intraSucc);
            if (order.empty()) return {};
            result.insert(result.end(), order.begin(), order.end());
        }
        return result;
    }
};
