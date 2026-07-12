class Solution {
public:
    int maxEqualRowsAfterFlips(vector<vector<int>>& matrix) {
        unordered_map<string, int> count;
        int ans = 0;

        for (const auto& row : matrix) {
            int flip = row[0];
            string key;
            for (int x : row) {
                key += to_string(x ^ flip) + ',';
            }
            ans = max(ans, ++count[key]);
        }

        return ans;
    }
};
