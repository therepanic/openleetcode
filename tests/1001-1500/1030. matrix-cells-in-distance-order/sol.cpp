class Solution {
public:
    vector<vector<int>> allCellsDistOrder(int rows, int cols, int rCenter, int cCenter) {
        vector<vector<int>> result;
        for (int r = 0; r < rows; ++r) {
            for (int c = 0; c < cols; ++c) {
                result.push_back({r, c});
            }
        }
        sort(result.begin(), result.end(), [rCenter, cCenter](const vector<int>& a, const vector<int>& b) {
            int d1 = abs(a[0] - rCenter) + abs(a[1] - cCenter);
            int d2 = abs(b[0] - rCenter) + abs(b[1] - cCenter);
            if (d1 != d2) return d1 < d2;
            if (a[0] != b[0]) return a[0] < b[0];
            return a[1] < b[1];
        });
        return result;
    }
};
