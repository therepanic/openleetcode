import java.util.*;

class Solution {
    public int visiblePoints(List<List<Integer>> points, int angle, List<Integer> location) {
        int[][] pointArray = new int[points.size()][2];
        for (int i = 0; i < points.size(); i++) {
            pointArray[i][0] = points.get(i).get(0);
            pointArray[i][1] = points.get(i).get(1);
        }
        return visiblePoints(pointArray, angle, new int[] {location.get(0), location.get(1)});
    }

    public int visiblePoints(int[][] points, int angle, int[] location) {
        List<Double> angles = new ArrayList<>();
        int same = 0;
        int x0 = location[0], y0 = location[1];

        for (int[] p : points) {
            int dx = p[0] - x0;
            int dy = p[1] - y0;
            if (dx == 0 && dy == 0) {
                same++;
                continue;
            }
            double ang = Math.toDegrees(Math.atan2(dy, dx));
            angles.add(ang);
        }
        
        if (angles.isEmpty()) return same;
        
        Collections.sort(angles);
        int n = angles.size();
        List<Double> full = new ArrayList<>(angles);
        for (double a : angles) full.add(a + 360);
        
        int maxVis = 0;
        int j = 0;
        for (int i = 0; i < n; i++) {
            while (j < full.size() && full.get(j) - full.get(i) <= angle) {
                j++;
            }
            maxVis = Math.max(maxVis, j - i);
        }
        
        return maxVis + same;
    }
}
