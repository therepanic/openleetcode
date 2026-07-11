class Solution {
public:
    vector<vector<int>> spiralMatrixIII(int rows, int cols, int rStart, int cStart) {
        int total = rows * cols;
        vector<vector<int>> res;
        res.reserve(total);
        res.push_back({rStart, cStart});
        int top = rStart, bottom = rStart;
        int left = cStart, right = cStart;
        while (res.size() < total) {
            right++;
            for (int i = left + 1; i <= right; i++) {
                if (top >= 0 && top < rows && i >= 0 && i < cols) {
                    res.push_back({top, i});
                    if (res.size() == total) return res;
                }
            }
            bottom++;
            for (int i = top + 1; i <= bottom; i++) {
                if (right >= 0 && right < cols && i >= 0 && i < rows) {
                    res.push_back({i, right});
                    if (res.size() == total) return res;
                }
            }
            left--;
            for (int i = right - 1; i >= left; i--) {
                if (i >= 0 && i < cols && bottom >= 0 && bottom < rows) {
                    res.push_back({bottom, i});
                    if (res.size() == total) return res;
                }
            }
            top--;
            for (int i = bottom - 1; i >= top; i--) {
                if (i >= 0 && i < rows && left >= 0 && left < cols) {
                    res.push_back({i, left});
                    if (res.size() == total) return res;
                }
            }
        }
        return res;
    }
};
