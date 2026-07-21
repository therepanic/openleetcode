class Solution {
public:
    vector<int> kWeakestRows(vector<vector<int>>& mat, int k) {
        int n = mat.size();
        vector<pair<int, int>> soldiers;
        for (int i = 0; i < n; i++) {
            int sum = 0;
            for (int val : mat[i]) {
                sum += val;
            }
            soldiers.push_back({sum, i});
        }
        sort(soldiers.begin(), soldiers.end());
        vector<int> result;
        for (int i = 0; i < k; i++) {
            result.push_back(soldiers[i].second);
        }
        return result;
    }
};
