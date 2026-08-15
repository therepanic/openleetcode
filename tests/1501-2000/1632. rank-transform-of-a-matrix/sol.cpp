class Solution {
public:
    vector<vector<int>> matrixRankTransform(vector<vector<int>>& matrix) {
        int m = matrix.size(), n = matrix[0].size();
        unordered_map<int, vector<pair<int,int>>> mp;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                mp[matrix[i][j]].push_back({i, j});
            }
        }
        
        vector<int> rank(m+n, 0);
        vector<vector<int>> ans(m, vector<int>(n, 0));
        
        vector<int> keys;
        for (auto& p : mp) keys.push_back(p.first);
        sort(keys.begin(), keys.end());
        
        for (int k : keys) {
            vector<int> parent(m+n);
            iota(parent.begin(), parent.end(), 0);
            function<int(int)> find = [&](int p) {
                if (p != parent[p]) parent[p] = find(parent[p]);
                return parent[p];
            };
            
            for (auto& cell : mp[k]) {
                int i = cell.first, j = cell.second;
                int ii = find(i);
                int jj = find(m+j);
                parent[ii] = jj;
                rank[jj] = max(rank[ii], rank[jj]);
            }
            
            unordered_set<int> seen;
            for (auto& cell : mp[k]) {
                int i = cell.first, j = cell.second;
                int ii = find(i);
                if (!seen.count(ii)) rank[ii] += 1;
                seen.insert(ii);
                int v = rank[ii];
                rank[i] = rank[m+j] = ans[i][j] = v;
            }
        }
        return ans;
    }
};
