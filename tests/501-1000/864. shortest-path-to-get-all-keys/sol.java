import java.util.*;

class Solution {
    public int shortestPathAllKeys(String[] grid) {
        int m = grid.length;
        int n = grid[0].length();
        int start_i = 0, start_j = 0;
        int total_keys = 0;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                char c = grid[i].charAt(j);
                if (c == '@') {
                    start_i = i;
                    start_j = j;
                }
                if (c >= 'a' && c <= 'f') {
                    total_keys++;
                }
            }
        }
        
        int target_mask = (1 << total_keys) - 1;
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(new int[]{start_i, start_j, 0});
        boolean[][][] seen = new boolean[m][n][1 << total_keys];
        seen[start_i][start_j][0] = true;
        int moves = 0;
        int[][] dirs = {{0,1}, {0,-1}, {1,0}, {-1,0}};
        
        while (!queue.isEmpty()) {
            int size = queue.size();
            for (int i = 0; i < size; i++) {
                int[] curr = queue.poll();
                int r = curr[0], c = curr[1], mask = curr[2];
                
                if (mask == target_mask) {
                    return moves;
                }
                
                for (int[] dir : dirs) {
                    int nr = r + dir[0];
                    int nc = c + dir[1];
                    
                    if (nr < 0 || nr >= m || nc < 0 || nc >= n) {
                        continue;
                    }
                    
                    char next_val = grid[nr].charAt(nc);
                    int next_mask = mask;
                    
                    if (next_val >= 'a' && next_val <= 'f') {
                        int key_bit = next_val - 'a';
                        next_mask |= (1 << key_bit);
                    }
                    
                    if (next_val >= 'A' && next_val <= 'F') {
                        int lock_bit = Character.toLowerCase(next_val) - 'a';
                        if ((next_mask & (1 << lock_bit)) == 0) {
                            continue;
                        }
                    }
                    
                    if (!seen[nr][nc][next_mask] && next_val != '#') {
                        queue.offer(new int[]{nr, nc, next_mask});
                        seen[nr][nc][next_mask] = true;
                    }
                }
            }
            moves++;
        }
        
        return -1;
    }
}
