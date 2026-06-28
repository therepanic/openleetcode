class Solution {
private:
    vector<int> parent;
    vector<int> rank;
    
    int find(int u) {
        if (parent[u] != u) {
            parent[u] = find(parent[u]);
        }
        return parent[u];
    }
    
    bool unionSet(int u, int v) {
        int pu = find(u);
        int pv = find(v);
        if (pu == pv) return false;
        if (rank[pu] < rank[pv]) {
            parent[pu] = pv;
        } else if (rank[pv] < rank[pu]) {
            parent[pv] = pu;
        } else {
            parent[pu] = pv;
            rank[pv]++;
        }
        return true;
    }
    
public:
    vector<int> findRedundantDirectedConnection(vector<vector<int>>& edges) {
        int n = edges.size();
        parent.resize(n + 1);
        rank.assign(n + 1, 0);
        vector<int> parentArr(n + 1, 0);
        
        for (int i = 0; i <= n; i++) {
            parent[i] = i;
        }
        
        vector<int> candidate1, candidate2;
        bool hasCandidates = false;
        
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1];
            if (parentArr[v] != 0) {
                candidate1 = {parentArr[v], v};
                candidate2 = {u, v};
                hasCandidates = true;
                break;
            }
            parentArr[v] = u;
        }
        
        for (auto& edge : edges) {
            int u = edge[0], v = edge[1];
            if (hasCandidates && u == candidate2[0] && v == candidate2[1]) {
                continue;
            }
            if (!unionSet(u, v)) {
                return hasCandidates ? candidate1 : vector<int>{u, v};
            }
        }
        
        return candidate2;
    }
};
