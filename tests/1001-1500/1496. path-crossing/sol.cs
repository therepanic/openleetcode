public class Solution {
    public bool IsPathCrossing(string path) {
        var set = new HashSet<(int, int)>();
        int x = 0, y = 0;
        set.Add((0, 0));
        foreach (char c in path) {
            if (c == 'N') y++;
            else if (c == 'S') y--;
            else if (c == 'E') x++;
            else if (c == 'W') x--;
            var point = (x, y);
            if (set.Contains(point)) return true;
            set.Add(point);
        }
        return false;
    }
}
