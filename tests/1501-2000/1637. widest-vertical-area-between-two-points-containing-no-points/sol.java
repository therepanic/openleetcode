class Solution {
    public int maxWidthOfVerticalArea(int[][] points) {
        int maxWidth = 0;
        Arrays.sort(points, (a, b) -> Integer.compare(a[0], b[0]));
        for (int i = 0; i < points.length - 1; i++) {
            int width = points[i+1][0] - points[i][0];
            maxWidth = Math.max(maxWidth, width);
        }
        return maxWidth;
    }
}
