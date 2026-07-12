class Solution {
public:
    vector<int> hitBricks(vector<vector<int>>& grid, vector<vector<int>>& hits) {
        int m = grid.size(), n = grid[0].size();
        vector<int> parent(m * n + 1);
        vector<int> rank(m * n + 1, 1);
        for (int i = 0; i <= m * n; i++) {
            parent[i] = i;
        }
        
        function<int(int)> find = [&](int p) {
            if (p != parent[p]) {
                parent[p] = find(parent[p]);
            }
            return parent[p];
        };
        
        auto unionSets = [&](int p, int q) {
            int rootP = find(p);
            int rootQ = find(q);
            if (rootP == rootQ) return false;
            if (rank[rootP] > rank[rootQ]) {
                swap(rootP, rootQ);
            }
            parent[rootP] = rootQ;
            rank[rootQ] += rank[rootP];
            return true;
        };
        
        unordered_set<int> seen;
        for (auto& hit : hits) {
            int i = hit[0], j = hit[1];
            if (grid[i][j] == 1) {
                seen.insert(i * n + j);
                grid[i][j] = 0;
            }
        }
        
        for (int j = 0; j < n; j++) {
            if (grid[0][j] == 1) {
                unionSets(j, m * n);
            }
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 1) {
                    if (i > 0 && grid[i-1][j] == 1) {
                        unionSets(i * n + j, (i-1) * n + j);
                    }
                    if (j > 0 && grid[i][j-1] == 1) {
                        unionSets(i * n + j, i * n + j - 1);
                    }
                }
            }
        }
        
        vector<int> ans(hits.size());
        int prevStable = rank[find(m * n)];
        vector<pair<int,int>> dirs = {{1,0}, {-1,0}, {0,1}, {0,-1}};
        
        for (int idx = hits.size() - 1; idx >= 0; idx--) {
            int i = hits[idx][0], j = hits[idx][1];
            if (seen.count(i * n + j)) {
                grid[i][j] = 1;
                if (i == 0) {
                    unionSets(j, m * n);
                }
                for (auto& [di, dj] : dirs) {
                    int ii = i + di, jj = j + dj;
                    if (ii >= 0 && ii < m && jj >= 0 && jj < n && grid[ii][jj] == 1) {
                        unionSets(i * n + j, ii * n + jj);
                    }
                }
                int currStable = rank[find(m * n)];
                ans[idx] = max(0, currStable - prevStable - 1);
                prevStable = currStable;
            } else {
                ans[idx] = 0;
            }
        }
        
        return ans;
    }
};
