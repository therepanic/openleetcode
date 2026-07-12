public class Solution {
    public double MinAreaFreeRect(int[][] points) {
        double ans = double.MaxValue;
        var seen = new Dictionary<(double, double, long), List<(int, int)>>();
        int n = points.Length;
        for (int i = 0; i < n; i++) {
            int x0 = points[i][0], y0 = points[i][1];
            for (int j = i + 1; j < n; j++) {
                int x1 = points[j][0], y1 = points[j][1];
                double cx = (x0 + x1) / 2.0;
                double cy = (y0 + y1) / 2.0;
                long d2 = (long)(x0 - x1) * (x0 - x1) + (long)(y0 - y1) * (y0 - y1);
                var key = (cx, cy, d2);
                if (seen.ContainsKey(key)) {
                    foreach (var (xx, yy) in seen[key]) {
                        double area = Math.Sqrt(((double)(x0 - xx) * (x0 - xx) + (double)(y0 - yy) * (y0 - yy)) *
                                                ((double)(x1 - xx) * (x1 - xx) + (double)(y1 - yy) * (y1 - yy)));
                        ans = Math.Min(ans, area);
                    }
                }
                if (!seen.ContainsKey(key)) seen[key] = new List<(int, int)>();
                seen[key].Add((x0, y0));
            }
        }
        return ans == double.MaxValue ? 0.0 : ans;
    }
}
