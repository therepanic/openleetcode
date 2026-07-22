class Solution {
public:
    vector<int> findDiagonalOrder(vector<vector<int>>& nums) {
        vector<vector<int>> l;
        for (int i = 0; i < nums.size(); i++) {
            for (int j = 0; j < nums[i].size(); j++) {
                l.push_back({i + j, i, j});
            }
        }

        map<int, vector<int>> h;
        for (auto& triple : l) {
            int sum = triple[0], i = triple[1], j = triple[2];
            h[sum].push_back(nums[i][j]);
        }

        vector<int> result;
        for (auto& [key, diag] : h) {
            for (int k = diag.size() - 1; k >= 0; k--) {
                result.push_back(diag[k]);
            }
        }
        return result;
    }
};
