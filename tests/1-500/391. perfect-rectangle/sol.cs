public class Solution {
    public bool IsRectangleCover(int[][] rectangles) {
        long area = 0;
        HashSet<string> corners = new HashSet<string>();
        
        foreach (var rect in rectangles) {
            int x = rect[0], y = rect[1], X = rect[2], Y = rect[3];
            area += (long)(X - x) * (Y - y);
            
            string p1 = $"{x},{y}";
            string p2 = $"{x},{Y}";
            string p3 = $"{X},{y}";
            string p4 = $"{X},{Y}";
            
            if (!corners.Add(p1)) corners.Remove(p1);
            if (!corners.Add(p2)) corners.Remove(p2);
            if (!corners.Add(p3)) corners.Remove(p3);
            if (!corners.Add(p4)) corners.Remove(p4);
        }
        
        if (corners.Count != 4) return false;
        
        int minX = int.MaxValue, minY = int.MaxValue;
        int maxX = int.MinValue, maxY = int.MinValue;
        
        foreach (var point in corners) {
            var parts = point.Split(',');
            int x = int.Parse(parts[0]);
            int y = int.Parse(parts[1]);
            minX = Math.Min(minX, x);
            minY = Math.Min(minY, y);
            maxX = Math.Max(maxX, x);
            maxY = Math.Max(maxY, y);
        }
        
        return (long)(maxX - minX) * (maxY - minY) == area;
    }
}
