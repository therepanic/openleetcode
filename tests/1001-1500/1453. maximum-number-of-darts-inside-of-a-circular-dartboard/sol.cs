public class Solution {
    public int NumPoints(int[][] darts, int r) {
        int ans = 1;
        double radius = r;
        double radiusSq = radius * radius;
        for (int i = 0; i < darts.Length; i++) {
            double x1 = darts[i][0], y1 = darts[i][1];
            for (int j = i + 1; j < darts.Length; j++) {
                double x2 = darts[j][0], y2 = darts[j][1];
                double dx = x2 - x1, dy = y2 - y1;
                double distanceSq = dx * dx + dy * dy;
                if (distanceSq > 4.0 * radiusSq) continue;
                double distance = Math.Sqrt(distanceSq);
                double midpointX = (x1 + x2) / 2.0;
                double midpointY = (y1 + y2) / 2.0;
                double offset = Math.Sqrt(Math.Max(0.0, radiusSq - distanceSq / 4.0));
                double normalX = -dy / distance;
                double normalY = dx / distance;
                foreach (double sign in new[] { -1.0, 1.0 }) {
                    double centerX = midpointX + sign * offset * normalX;
                    double centerY = midpointY + sign * offset * normalY;
                    int count = 0;
                    foreach (var dart in darts) {
                        double ex = dart[0] - centerX;
                        double ey = dart[1] - centerY;
                        if (ex * ex + ey * ey <= radiusSq + 1e-9) count++;
                    }
                    ans = Math.Max(ans, count);
                }
            }
        }
        return ans;
    }
}
