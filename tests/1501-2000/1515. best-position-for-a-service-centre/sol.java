class Solution {
    public double getMinDistSum(int[][] positions) {
        double x = 0.0, y = 0.0;
        for (int[] p : positions) {
            x += p[0];
            y += p[1];
        }
        x /= positions.length;
        y /= positions.length;
        
        double ans = distSum(positions, x, y);
        double chg = 100.0;
        
        while (chg > 1e-6) {
            boolean zoom = true;
            int[][] dirs = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
            for (int[] d : dirs) {
                double xx = x + chg * d[0];
                double yy = y + chg * d[1];
                double dd = distSum(positions, xx, yy);
                if (dd < ans) {
                    ans = dd;
                    x = xx;
                    y = yy;
                    zoom = false;
                    break;
                }
            }
            if (zoom) chg /= 2;
        }
        return ans;
    }
    
    private double distSum(int[][] positions, double x, double y) {
        double sum = 0.0;
        for (int[] p : positions) {
            sum += Math.sqrt((x - p[0]) * (x - p[0]) + (y - p[1]) * (y - p[1]));
        }
        return sum;
    }
}
