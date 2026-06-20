class Solution {
    public boolean isRectangleCover(int[][] rectangles) {
        long area = 0;
        Set<String> corners = new HashSet<>();
        
        for (int[] rect : rectangles) {
            int x = rect[0], y = rect[1], X = rect[2], Y = rect[3];
            area += (long)(X - x) * (Y - y);
            
            String p1 = x + "," + y;
            String p2 = x + "," + Y;
            String p3 = X + "," + y;
            String p4 = X + "," + Y;
            
            if (!corners.add(p1)) corners.remove(p1);
            if (!corners.add(p2)) corners.remove(p2);
            if (!corners.add(p3)) corners.remove(p3);
            if (!corners.add(p4)) corners.remove(p4);
        }
        
        if (corners.size() != 4) return false;
        
        int minX = Integer.MAX_VALUE, minY = Integer.MAX_VALUE;
        int maxX = Integer.MIN_VALUE, maxY = Integer.MIN_VALUE;
        
        for (String point : corners) {
            String[] parts = point.split(",");
            int x = Integer.parseInt(parts[0]);
            int y = Integer.parseInt(parts[1]);
            minX = Math.min(minX, x);
            minY = Math.min(minY, y);
            maxX = Math.max(maxX, x);
            maxY = Math.max(maxY, y);
        }
        
        return (long)(maxX - minX) * (maxY - minY) == area;
    }
}
