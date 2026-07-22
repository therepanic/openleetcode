class Solution {
public:
    int oddCells(int m, int n, vector<vector<int>>& indices) {
        vector<vector<int>> a(m, vector<int>(n, 0));
        int c = 0;
        for (auto& k : indices) {
            for (int u = 0; u < n; u++) {
                a[k[0]][u]++;
            }
            for (int l = 0; l < m; l++) {
                a[l][k[1]]++;
            }
        }
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (a[i][j] % 2 != 0) {
                    c++;
                }
            }
        }
        return c;
    }
};
