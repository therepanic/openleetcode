public class Solution {
    public bool IsEscapePossible(int[][] blocked, int[] source, int[] target) {
        var blockedSet = new HashSet<(int, int)>();
        foreach (var b in blocked) {
            blockedSet.Add((b[0], b[1]));
        }
        int MAX = blocked.Length * blocked.Length / 2;
        var dirs = new (int, int)[] { (-1, 0), (1, 0), (0, -1), (0, 1) };

        bool Bfs(int[] start, int[] end) {
            var visited = new HashSet<(int, int)>();
            var queue = new Queue<(int, int)>();
            queue.Enqueue((start[0], start[1]));
            visited.Add((start[0], start[1]));
            int count = 0;

            while (queue.Count > 0) {
                var (x, y) = queue.Dequeue();
                if (x == end[0] && y == end[1]) return true;
                if (count > MAX) return true;

                foreach (var (dx, dy) in dirs) {
                    int nx = x + dx;
                    int ny = y + dy;
                    if (nx >= 0 && nx < 1000000 && ny >= 0 && ny < 1000000) {
                        var key = (nx, ny);
                        if (!visited.Contains(key) && !blockedSet.Contains(key)) {
                            visited.Add(key);
                            queue.Enqueue(key);
                        }
                    }
                }
                count++;
            }
            return false;
        }

        return Bfs(source, target) && Bfs(target, source);
    }
}
