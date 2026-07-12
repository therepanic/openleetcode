class Solution {
    public double minAreaFreeRect(int[][] points) {
        double ans = Double.MAX_VALUE;
        Map<String, List<int[]>> seen = new HashMap<>();
        int n = points.length;
        for (int i = 0; i < n; i++) {
            int x0 = points[i][0], y0 = points[i][1];
            for (int j = i + 1; j < n; j++) {
                int x1 = points[j][0], y1 = points[j][1];
                double cx = (x0 + x1) / 2.0;
                double cy = (y0 + y1) / 2.0;
                long d2 = (long)(x0 - x1) * (x0 - x1) + (long)(y0 - y1) * (y0 - y1);
                String key = cx + "," + cy + "," + d2;
                if (seen.containsKey(key)) {
                    for (int[] prev : seen.get(key)) {
                        int xx = prev[0], yy = prev[1];
                        double area = Math.sqrt(((double)(x0 - xx) * (x0 - xx) + (double)(y0 - yy) * (y0 - yy)) *
                                                ((double)(x1 - xx) * (x1 - xx) + (double)(y1 - yy) * (y1 - yy)));
                        ans = Math.min(ans, area);
                    }
                }
                seen.computeIfAbsent(key, k -> new ArrayList<>()).add(new int[]{x0, y0});
            }
        }
        return ans == Double.MAX_VALUE ? 0.0 : ans;
    }
}
