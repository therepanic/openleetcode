class Solution {
public:
    vector<bool> distanceLimitedPathsExist(int n, vector<vector<int>>& edgeList, vector<vector<int>>& queries) {
        vector<int> parent(n);
        vector<int> rank(n, 0);
        for (int i = 0; i < n; i++) parent[i] = i;
        
        function<int(int)> find = [&](int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        };
        
        auto unionSets = [&](int x, int y) {
            int xroot = find(x);
            int yroot = find(y);
            if (xroot == yroot) return;
            if (rank[xroot] < rank[yroot]) {
                parent[xroot] = yroot;
            } else if (rank[xroot] > rank[yroot]) {
                parent[yroot] = xroot;
            } else {
                parent[yroot] = xroot;
                rank[xroot]++;
            }
        };
        
        // add index to queries
        vector<vector<int>> queriesWithIdx;
        for (int i = 0; i < queries.size(); i++) {
            queriesWithIdx.push_back({queries[i][0], queries[i][1], queries[i][2], i});
        }
        
        sort(queriesWithIdx.begin(), queriesWithIdx.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[2] < b[2];
        });
        sort(edgeList.begin(), edgeList.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[2] < b[2];
        });
        
        int idx = 0;
        vector<bool> res(queries.size(), false);
        for (auto& q : queriesWithIdx) {
            while (idx < edgeList.size() && edgeList[idx][2] < q[2]) {
                unionSets(edgeList[idx][0], edgeList[idx][1]);
                idx++;
            }
            if (find(q[0]) == find(q[1])) {
                res[q[3]] = true;
            }
        }
        return res;
    }
};
