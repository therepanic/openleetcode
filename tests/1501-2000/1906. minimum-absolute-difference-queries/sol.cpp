class Solution {
public:
    vector<int> minDifference(vector<int>& nums, vector<vector<int>>& queries) {
        int maxVal = 0;
        for (int x : nums) maxVal = max(maxVal, x);
        vector<vector<int>> p(nums.size() + 1, vector<int>(maxVal + 1, 0));
        for (int j = 0; j <= maxVal; j++) p[0][j] = 0;
        for (int i = 0; i < nums.size(); i++) {
            for (int j = 0; j <= maxVal; j++) {
                p[i + 1][j] = p[i][j] + (nums[i] == j ? 1 : 0);
            }
        }
        vector<int> res(queries.size());
        for (int qi = 0; qi < queries.size(); qi++) {
            int l = queries[qi][0], r = queries[qi][1];
            vector<int> diff(maxVal + 1, 0);
            for (int j = 0; j <= maxVal; j++) diff[j] = p[r + 1][j] - p[l][j];
            int prev = -1;
            int best = -1;
            for (int j = 0; j <= maxVal; j++) {
                if (diff[j] > 0) {
                    if (prev >= 0) {
                        if (best == -1 || j - prev < best) best = j - prev;
                    }
                    prev = j;
                }
            }
            res[qi] = best;
        }
        return res;
    }
};
