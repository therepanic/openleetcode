public class Solution {
    public bool CheckOverlap(int radius, int xCenter, int yCenter, int x1, int y1, int x2, int y2) {
        int nearestX = Math.Max(x1, Math.Min(x2, xCenter));
        int nearestY = Math.Max(y1, Math.Min(y2, yCenter));
        int dist = (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter);
        return dist <= radius * radius;
    }
}
