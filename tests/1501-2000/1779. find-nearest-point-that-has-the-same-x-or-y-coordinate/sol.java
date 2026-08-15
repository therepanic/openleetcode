class Solution {
    public int nearestValidPoint(int x, int y, int[][] points) {
        int currentMinDistance = 20001;
        int currentMinIndex = -1;
        for (int i = 0; i < points.length; i++) {
            int a = points[i][0];
            int b = points[i][1];
            if (x == a || y == b) {
                int distance = Math.abs(x - a) + Math.abs(y - b);
                if (distance < currentMinDistance) {
                    currentMinDistance = distance;
                    currentMinIndex = i;
                }
            }
        }
        return currentMinIndex;
    }
}
