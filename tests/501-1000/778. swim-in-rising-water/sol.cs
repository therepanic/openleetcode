public class Solution {
    public int SwimInWater(int[][] grid) {
        int n = grid.Length;
        int[][] dirs = new int[][] { new int[] {0,-1}, new int[] {0,1}, new int[] {-1,0}, new int[] {1,0} };
        
        bool Dfs(int x, int y, int t, bool[][] vis) {
            if (x == n - 1 && y == n - 1) return true;
            vis[x][y] = true;
            foreach (var d in dirs) {
                int nx = x + d[0], ny = y + d[1];
                if (nx >= 0 && nx < n && ny >= 0 && ny < n && !vis[nx][ny] && grid[nx][ny] <= t) {
                    if (Dfs(nx, ny, t, vis)) return true;
                }
            }
            return false;
        }
        
        int low = 0, high = n * n - 1, ans = int.MaxValue;
        while (low <= high) {
            int mid = (low + high) / 2;
            bool[][] vis = new bool[n][];
            for (int i = 0; i < n; i++) vis[i] = new bool[n];
            if (grid[0][0] <= mid && Dfs(0, 0, mid, vis)) {
                ans = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return ans;
    }
}
