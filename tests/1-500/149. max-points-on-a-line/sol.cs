public class Solution {
    public int MaxPoints(int[][] points) {
        if (points.Length <= 2) return points.Length;
        int best = 0;
        for (int i = 0; i < points.Length; i++) {
            var count = new System.Collections.Generic.Dictionary<string, int>();
            int local = 0;
            int duplicates = 1;
            int x1 = points[i][0];
            int y1 = points[i][1];
            for (int j = i + 1; j < points.Length; j++) {
                int dx = points[j][0] - x1;
                int dy = points[j][1] - y1;
                if (dx == 0 && dy == 0) {
                    duplicates++;
                    continue;
                }
                int g = Gcd(dx, dy);
                dx /= g;
                dy /= g;
                if (dx < 0) {
                    dx = -dx;
                    dy = -dy;
                } else if (dx == 0) {
                    dy = 1;
                } else if (dy == 0) {
                    dx = 1;
                }
                string key = dx + "/" + dy;
                int next = count.TryGetValue(key, out var value) ? value + 1 : 1;
                count[key] = next;
                if (next > local) local = next;
            }
            if (local + duplicates > best) best = local + duplicates;
        }
        return best;
    }

    private int Gcd(int a, int b) {
        a = System.Math.Abs(a);
        b = System.Math.Abs(b);
        while (b != 0) {
            int t = a % b;
            a = b;
            b = t;
        }
        return a;
    }
}
