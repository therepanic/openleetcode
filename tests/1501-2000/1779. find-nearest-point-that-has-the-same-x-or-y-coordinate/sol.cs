public class Solution {
    public int NearestValidPoint(int x, int y, int[][] points) {
        int currentMinDistance = 20001;
        int currentMinIndex = -1;
        for (int i = 0; i < points.Length; i++) {
            int a = points[i][0];
            int b = points[i][1];
            if (x == a || y == b) {
                int distance = Math.Abs(x - a) + Math.Abs(y - b);
                if (distance < currentMinDistance) {
                    currentMinDistance = distance;
                    currentMinIndex = i;
                }
            }
        }
        return currentMinIndex;
    }
}
