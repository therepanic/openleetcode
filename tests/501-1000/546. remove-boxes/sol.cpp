class Solution {
public:
    int removeBoxes(vector<int>& boxes) {
        vector<pair<int, int>> groups;
        int i = 0;
        while (i < boxes.size()) {
            int color = boxes[i];
            int count = 0;
            while (i < boxes.size() && boxes[i] == color) {
                count++;
                i++;
            }
            groups.push_back({color, count});
        }
        
        int n = groups.size();
        vector<vector<vector<int>>> dp(n, vector<vector<int>>(n, vector<int>(boxes.size() + 1, 0)));
        
        function<int(int, int, int)> dfs = [&](int l, int r, int k) -> int {
            if (l > r) return 0;
            if (dp[l][r][k] != 0) return dp[l][r][k];
            
            int color = groups[l].first;
            int count = groups[l].second + k;
            int res = count * count + dfs(l + 1, r, 0);
            
            for (int i = l + 1; i <= r; i++) {
                if (groups[i].first == color) {
                    int left = dfs(l + 1, i - 1, 0);
                    int right = dfs(i, r, count);
                    res = max(res, left + right);
                }
            }
            
            dp[l][r][k] = res;
            return res;
        };
        
        return dfs(0, n - 1, 0);
    }
};
