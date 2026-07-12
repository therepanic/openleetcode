class Solution {
public:
    double champagneTower(int poured, int query_row, int query_glass) {
        vector<vector<double>> tower(102, vector<double>(102, 0.0));
        tower[0][0] = poured;
        
        for (int r = 0; r <= query_row; r++) {
            for (int c = 0; c <= r; c++) {
                if (tower[r][c] > 1) {
                    double excess = (tower[r][c] - 1.0) / 2.0;
                    tower[r][c] = 1;
                    tower[r+1][c] += excess;
                    tower[r+1][c+1] += excess;
                }
            }
        }
        
        return tower[query_row][query_glass];
    }
};
