public class Solution {
    public int MinimumEffortPath(int[][] heights) {
        if (heights.Length == 0) return 0;
        int rows = heights.Length, cols = heights[0].Length;
        var pq = new SortedSet<(int effort, int r, int c)>();
        pq.Add((0, 0, 0));
        int maxEffort = 0;
        bool[,] visited = new bool[rows, cols];
        int[][] dirs = new int[][] { new int[] {1, 0}, new int[] {-1, 0}, new int[] {0, 1}, new int[] {0, -1} };
        while (pq.Count > 0) {
            var curr = pq.Min;
            pq.Remove(curr);
            int effort = curr.effort, r = curr.r, c = curr.c;
            maxEffort = Math.Max(maxEffort, effort);
            if (r == rows - 1 && c == cols - 1) return maxEffort;
            if (visited[r, c]) continue;
            visited[r, c] = true;
            foreach (var d in dirs) {
                int nr = r + d[0], nc = c + d[1];
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited[nr, nc]) {
                    int newEffort = Math.Abs(heights[nr][nc] - heights[r][c]);
                    pq.Add((newEffort, nr, nc));
                }
            }
        }
        return maxEffort;
    }
}
