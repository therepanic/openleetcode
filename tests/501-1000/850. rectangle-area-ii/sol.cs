public class Solution {
    public int RectangleArea(int[][] rectangles) {
        const int MOD = 1000000007;
        const int OPEN = 0;
        const int CLOSE = 1;
        
        var events = new List<(int y, int typ, int x1, int x2)>();
        foreach (var r in rectangles) {
            int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];
            events.Add((y1, OPEN, x1, x2));
            events.Add((y2, CLOSE, x1, x2));
        }
        events.Sort((a, b) => a.y.CompareTo(b.y));
        
        long res = 0;
        int curY = events[0].y;
        var active = new List<(int x1, int x2)>();
        
        foreach (var (y, typ, x1, x2) in events) {
            long q = 0;
            int cur = -1;
            active.Sort((a, b) => a.x1.CompareTo(b.x1));
            foreach (var (ax1, ax2) in active) {
                q += Math.Max(0, ax2 - Math.Max(cur, ax1));
                cur = Math.Max(cur, ax2);
            }
            
            res = (res + q * (y - curY)) % MOD;
            curY = y;
            
            if (typ == OPEN) {
                active.Add((x1, x2));
            } else {
                active.Remove((x1, x2));
            }
        }
        
        return (int)res;
    }
}
