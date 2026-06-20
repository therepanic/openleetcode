class Solution {
    public int maxPoints(int[][] points) {
        if (points.length <= 2) return points.length;
        int best = 0;
        for (int i = 0; i < points.length; i++) {
            java.util.HashMap<String, Integer> count = new java.util.HashMap<>();
            int local = 0;
            int duplicates = 1;
            int x1 = points[i][0];
            int y1 = points[i][1];
            for (int j = i + 1; j < points.length; j++) {
                int dx = points[j][0] - x1;
                int dy = points[j][1] - y1;
                if (dx == 0 && dy == 0) {
                    duplicates++;
                    continue;
                }
                int g = gcd(dx, dy);
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
                String key = dx + "/" + dy;
                int next = count.getOrDefault(key, 0) + 1;
                count.put(key, next);
                local = Math.max(local, next);
            }
            best = Math.max(best, local + duplicates);
        }
        return best;
    }

    private int gcd(int a, int b) {
        a = Math.abs(a);
        b = Math.abs(b);
        while (b != 0) {
            int t = a % b;
            a = b;
            b = t;
        }
        return a;
    }
}
