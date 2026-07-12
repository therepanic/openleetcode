public class Solution {
    public double ChampagneTower(int poured, int query_row, int query_glass) {
        double[][] tower = new double[102][];
        for (int i = 0; i < 102; i++) {
            tower[i] = new double[102];
        }
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
}
