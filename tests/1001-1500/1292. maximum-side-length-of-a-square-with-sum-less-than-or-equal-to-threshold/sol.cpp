class Solution {
public:
    int maxSideLength(vector<vector<int>>& mat, int threshold) {
        int n = mat.size();
        int m = mat[0].size();
        vector<vector<int>> pref = mat;
        for (int i = 0; i < n; i++) {
            for (int j = 1; j < m; j++) {
                pref[i][j] += pref[i][j - 1];
            }
        }
        for (int j = 0; j < m; j++) {
            for (int i = 1; i < n; i++) {
                pref[i][j] += pref[i - 1][j];
            }
        }
        auto isValid = [&](int k) {
            for (int i = k - 1; i < n; i++) {
                for (int j = k - 1; j < m; j++) {
                    int x1 = i - k + 1;
                    int y1 = j - k + 1;
                    int total = pref[i][j];
                    if (x1 > 0) total -= pref[x1 - 1][j];
                    if (y1 > 0) total -= pref[i][y1 - 1];
                    if (x1 > 0 && y1 > 0) total += pref[x1 - 1][y1 - 1];
                    if (total <= threshold) return true;
                }
            }
            return false;
        };
        int low = 1, high = min(n, m);
        int ans = 0;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (isValid(mid)) {
                ans = mid;
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return ans;
    }
};
