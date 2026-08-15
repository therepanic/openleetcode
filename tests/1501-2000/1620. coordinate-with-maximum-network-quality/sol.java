class Solution {
    public int[] bestCoordinate(int[][] towers, int radius) {
        int maxX = 0;
        int maxY = 0;
        for (int[] t : towers) {
            maxX = Math.max(maxX, t[0]);
            maxY = Math.max(maxY, t[1]);
        }
        
        int bestQuality = 0;
        int[] bestCoord = new int[]{0, 0};
        
        for (int x = 0; x <= maxX; x++) {
            for (int y = 0; y <= maxY; y++) {
                int quality = 0;
                for (int[] t : towers) {
                    double dist = Math.sqrt(Math.pow(t[0] - x, 2) + Math.pow(t[1] - y, 2));
                    if (dist <= radius) {
                        quality += (int)(t[2] / (1 + dist));
                    }
                }
                if (quality > bestQuality || (quality == bestQuality && (x < bestCoord[0] || (x == bestCoord[0] && y < bestCoord[1])))) {
                    bestQuality = quality;
                    bestCoord[0] = x;
                    bestCoord[1] = y;
                }
            }
        }
        
        return bestCoord;
    }
}
