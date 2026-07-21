public class Solution {
    public double GetMinDistSum(int[][] positions) {
        double DistSum(double x, double y) {
            double sum = 0.0;
            foreach (var p in positions) {
                double dx = x - p[0];
                double dy = y - p[1];
                sum += Math.Sqrt(dx * dx + dy * dy);
            }
            return sum;
        }
        
        double x = 0.0, y = 0.0;
        foreach (var p in positions) {
            x += p[0];
            y += p[1];
        }
        x /= positions.Length;
        y /= positions.Length;
        
        double ans = DistSum(x, y);
        double chg = 100.0;
        int[][] dirs = new int[][] {
            new int[] {-1, 0}, new int[] {0, -1}, new int[] {0, 1}, new int[] {1, 0}
        };
        
        while (chg > 1e-6) {
            bool zoom = true;
            foreach (var d in dirs) {
                double xx = x + chg * d[0];
                double yy = y + chg * d[1];
                double dd = DistSum(xx, yy);
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
}
