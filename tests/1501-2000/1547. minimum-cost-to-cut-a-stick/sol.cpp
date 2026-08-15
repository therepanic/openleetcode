class Solution {
public:
    int minCost(int n, vector<int>& cuts) {
        vector<int> c = cuts;
        c.push_back(0);
        c.push_back(n);
        sort(c.begin(), c.end());
        int m = c.size();
        vector<vector<int>> memo(m, vector<int>(m, -1));
        return optimize(0, m-1, c, memo);
    }
    
    int optimize(int i, int j, vector<int>& c, vector<vector<int>>& memo) {
        if (j - i <= 1) return 0;
        if (memo[i][j] != -1) return memo[i][j];
        int res = INT_MAX;
        for (int k = i+1; k < j; k++) {
            int val = optimize(i, k, c, memo) + optimize(k, j, c, memo);
            res = min(res, val);
        }
        memo[i][j] = res + (c[j] - c[i]);
        return memo[i][j];
    }
};
