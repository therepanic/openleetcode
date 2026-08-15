class Solution {
    public int maxBuilding(int n, int[][] restrictions) {
        int[][] r = new int[restrictions.length + 1][2];
        for (int i = 0; i < restrictions.length; i++) {
            r[i] = restrictions[i];
        }
        r[restrictions.length] = new int[]{1, 0};
        java.util.Arrays.sort(r, (a, b) -> Integer.compare(a[0], b[0]));
        int m = r.length;
        
        for (int i = 1; i < m; i++) {
            r[i][1] = Math.min(r[i][1], r[i-1][1] + Math.abs(r[i][0] - r[i-1][0]));
        }
        
        for (int i = m - 2; i >= 0; i--) {
            r[i][1] = Math.min(r[i][1], r[i+1][1] + Math.abs(r[i+1][0] - r[i][0]));
        }
        
        int res = 0;
        for (int i = 1; i < m; i++) {
            res = Math.max(res, (r[i-1][1] + r[i][1] + r[i][0] - r[i-1][0]) / 2);
        }
        
        return Math.max(res, r[m-1][1] + n - r[m-1][0]);
    }
}
