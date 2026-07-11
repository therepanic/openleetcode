import java.util.*;

class Solution {
    public int numEnclaves(int[][] grid) {
        int total = 0;
        for (int[] row : grid) {
            for (int val : row) {
                total += val;
            }
        }
        
        int m = grid.length;
        int n = grid[0].length;
        if (m == 1 || n == 1) return 0;
        
        Queue<int[]> q = new LinkedList<>();
        Set<String> seen = new HashSet<>();
        
        for (int i = 0; i < n; i++) {
            if (grid[0][i] == 1) {
                q.offer(new int[]{0, i});
                seen.add("0," + i);
            }
            if (grid[m-1][i] == 1) {
                q.offer(new int[]{m-1, i});
                seen.add((m-1) + "," + i);
            }
        }
        for (int i = 1; i < m - 1; i++) {
            if (grid[i][0] == 1) {
                q.offer(new int[]{i, 0});
                seen.add(i + ",0");
            }
            if (grid[i][n-1] == 1) {
                q.offer(new int[]{i, n-1});
                seen.add(i + "," + (n-1));
            }
        }
        
        int[][] directions = {{0,1},{1,0},{0,-1},{-1,0}};
        int nextTotal = 0;
        
        while (!q.isEmpty()) {
            int[] curr = q.poll();
            int x = curr[0], y = curr[1];
            nextTotal++;
            
            for (int[] dir : directions) {
                int nx = x + dir[0];
                int ny = y + dir[1];
                String key = nx + "," + ny;
                if (nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] == 1 && !seen.contains(key)) {
                    q.offer(new int[]{nx, ny});
                    seen.add(key);
                }
            }
        }
        
        return total - nextTotal;
    }
}
