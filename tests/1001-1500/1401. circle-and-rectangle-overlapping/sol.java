class Solution {
    public boolean checkOverlap(int radius, int xCenter, int yCenter, int x1, int y1, int x2, int y2) {
        int nearestX = Math.max(x1, Math.min(x2, xCenter));
        int nearestY = Math.max(y1, Math.min(y2, yCenter));
        int dist = (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter);
        return dist <= radius * radius;
    }
}
