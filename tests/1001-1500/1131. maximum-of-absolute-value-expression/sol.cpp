class Solution {
public:
    int maxAbsValExpr(vector<int>& arr1, vector<int>& arr2) {
        int res = 0;
        int n = arr1.size();
        vector<pair<int, int>> signs = {{1, 1}, {1, -1}, {-1, 1}, {-1, -1}};

        for (auto [p, q] : signs) {
            int maxVal = INT_MIN;
            int minVal = INT_MAX;
            for (int i = 0; i < n; i++) {
                int value = p * arr1[i] + q * arr2[i] + i;
                maxVal = max(maxVal, value);
                minVal = min(minVal, value);
            }
            res = max(res, maxVal - minVal);
        }

        return res;
    }
};
