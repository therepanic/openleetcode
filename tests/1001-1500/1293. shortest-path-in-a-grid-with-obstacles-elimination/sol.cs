public class Solution {
    public int ShortestPath(int[][] grid, int k) {
        int n = grid.Length, m = grid[0].Length;
        var q = new Queue<int[]>();
        q.Enqueue(new int[]{0, 0, k, 0});
        var visi = new HashSet<string>();
        visi.Add("0,0," + k);
        int[][] dirs = new int[][]{new int[]{-1, 0}, new int[]{0, 1}, new int[]{1, 0}, new int[]{0, -1}};
        while (q.Count > 0) {
            var cur = q.Dequeue();
            int r = cur[0], c = cur[1], kRem = cur[2], d = cur[3];
            if (r == n - 1 && c == m - 1) return d;
            if (grid[r][c] == 1) kRem--;
            foreach (var dir in dirs) {
                int nr = r + dir[0], nc = c + dir[1];
                if (nr >= 0 && nr < n && nc >= 0 && nc < m) {
                    var key = nr + "," + nc + "," + kRem;
                    if (!visi.Contains(key) && kRem >= 0) {
                        visi.Add(key);
                        q.Enqueue(new int[]{nr, nc, kRem, d + 1});
                    }
                }
            }
        }
        return -1;
    }
}
