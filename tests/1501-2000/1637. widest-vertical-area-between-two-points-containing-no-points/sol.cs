public class Solution {
    public int MaxWidthOfVerticalArea(int[][] points) {
        int maxWidth = 0;
        Array.Sort(points, (a, b) => a[0].CompareTo(b[0]));
        for (int i = 0; i < points.Length - 1; i++) {
            int width = points[i+1][0] - points[i][0];
            maxWidth = Math.Max(maxWidth, width);
        }
        return maxWidth;
    }
}
