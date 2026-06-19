public class Solution {
    public int FindMinArrowShots(int[][] points) {
        Array.Sort(points, (a, b) => a[1].CompareTo(b[1]));
        int arrows = 1;
        int end = points[0][1];
        foreach (var point in points) {
            if (point[0] > end) {
                arrows++;
                end = point[1];
            }
        }
        return arrows;
    }
}
