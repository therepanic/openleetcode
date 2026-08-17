class Solution {
public:
    int maxBuilding(int n, vector<vector<int>>& restrictions) {
        restrictions.push_back({1, 0});
        sort(restrictions.begin(), restrictions.end());
        int m = restrictions.size();
        
        for (int i = 1; i < m; i++) {
            restrictions[i][1] = min(restrictions[i][1], restrictions[i-1][1] + abs(restrictions[i][0] - restrictions[i-1][0]));
        }
        
        for (int i = m - 2; i >= 0; i--) {
            restrictions[i][1] = min(restrictions[i][1], restrictions[i+1][1] + abs(restrictions[i+1][0] - restrictions[i][0]));
        }
        
        int res = 0;
        for (int i = 1; i < m; i++) {
            res = max(res, (restrictions[i-1][1] + restrictions[i][1] + restrictions[i][0] - restrictions[i-1][0]) / 2);
        }
        
        return max(res, restrictions[m-1][1] + n - restrictions[m-1][0]);
    }
};
