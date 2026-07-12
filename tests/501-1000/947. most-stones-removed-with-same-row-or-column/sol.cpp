class Solution {
public:
    int removeStones(vector<vector<int>>& stones) {
        int n = stones.size();
        vector<vector<int>> matrix(n);
        
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]) {
                    matrix[i].push_back(j);
                    matrix[j].push_back(i);
                }
            }
        }
        
        vector<bool> visited(n, false);
        int components = 0;
        
        function<void(int)> dfs = [&](int idx) {
            visited[idx] = true;
            for (int nei : matrix[idx]) {
                if (!visited[nei]) {
                    dfs(nei);
                }
            }
        };
        
        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                components++;
                dfs(i);
            }
        }
        
        return n - components;
    }
};
