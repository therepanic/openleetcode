public class Solution {
    public int MinPushBox(char[][] grid) {
        int rows = grid.Length, cols = grid[0].Length;
        (int, int) player = (0, 0), box = (0, 0), target = (0, 0);
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == 'S') player = (i, j);
                else if (grid[i][j] == 'B') box = (i, j);
                else if (grid[i][j] == 'T') target = (i, j);
            }
        }
        
        (int, int)[] dirs = {(1, 0), (-1, 0), (0, 1), (0, -1)};
        var q = new Queue<((int,int) box, (int,int) player, int pushes)>();
        q.Enqueue((box, player, 0));
        var seen = new HashSet<(int,int,int,int)>();
        seen.Add((box.Item1, box.Item2, player.Item1, player.Item2));
        
        while (q.Count > 0) {
            var cur = q.Dequeue();
            var b = cur.box;
            var p = cur.player;
            int pushes = cur.pushes;
            
            if (b == target) return pushes;
            
            var reachable = new HashSet<(int,int)>();
            var walk = new Queue<(int,int)>();
            walk.Enqueue(p);
            reachable.Add(p);
            
            while (walk.Count > 0) {
                var w = walk.Dequeue();
                foreach (var (dx, dy) in dirs) {
                    int nx = w.Item1 + dx, ny = w.Item2 + dy;
                    if (nx >= 0 && nx < rows && ny >= 0 && ny < cols &&
                        !(nx == b.Item1 && ny == b.Item2) && grid[nx][ny] != '#' &&
                        !reachable.Contains((nx, ny))) {
                        reachable.Add((nx, ny));
                        walk.Enqueue((nx, ny));
                    }
                }
            }
            
            foreach (var (dx, dy) in dirs) {
                var nextBox = (b.Item1 + dx, b.Item2 + dy);
                var behind = (b.Item1 - dx, b.Item2 - dy);
                if (nextBox.Item1 >= 0 && nextBox.Item1 < rows && nextBox.Item2 >= 0 && nextBox.Item2 < cols &&
                    grid[nextBox.Item1][nextBox.Item2] != '#' &&
                    reachable.Contains(behind) &&
                    !seen.Contains((nextBox.Item1, nextBox.Item2, b.Item1, b.Item2))) {
                    seen.Add((nextBox.Item1, nextBox.Item2, b.Item1, b.Item2));
                    q.Enqueue((nextBox, b, pushes + 1));
                }
            }
        }
        return -1;
    }
}
