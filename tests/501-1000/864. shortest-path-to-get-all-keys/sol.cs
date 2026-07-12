public class Solution {
    public int ShortestPathAllKeys(string[] grid) {
        int m = grid.Length;
        int n = grid[0].Length;
        int start_i = 0, start_j = 0;
        int total_keys = 0;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == '@') {
                    start_i = i;
                    start_j = j;
                }
                if (grid[i][j] >= 'a' && grid[i][j] <= 'f') {
                    total_keys++;
                }
            }
        }
        
        int target_mask = (1 << total_keys) - 1;
        Queue<(int, int, int)> queue = new Queue<(int, int, int)>();
        queue.Enqueue((start_i, start_j, 0));
        bool[,,] seen = new bool[m, n, 1 << total_keys];
        seen[start_i, start_j, 0] = true;
        int moves = 0;
        (int, int)[] dirs = {(0, 1), (0, -1), (1, 0), (-1, 0)};
        
        while (queue.Count > 0) {
            int size = queue.Count;
            for (int k = 0; k < size; k++) {
                var (r, c, mask) = queue.Dequeue();
                
                if (mask == target_mask) {
                    return moves;
                }
                
                foreach (var (dx, dy) in dirs) {
                    int nr = r + dx;
                    int nc = c + dy;
                    
                    if (nr < 0 || nr >= m || nc < 0 || nc >= n) {
                        continue;
                    }
                    
                    char next_val = grid[nr][nc];
                    int next_mask = mask;
                    
                    if (next_val >= 'a' && next_val <= 'f') {
                        int key_bit = next_val - 'a';
                        next_mask |= (1 << key_bit);
                    }
                    
                    if (next_val >= 'A' && next_val <= 'F') {
                        int lock_bit = char.ToLower(next_val) - 'a';
                        if ((next_mask & (1 << lock_bit)) == 0) {
                            continue;
                        }
                    }
                    
                    if (!seen[nr, nc, next_mask] && next_val != '#') {
                        queue.Enqueue((nr, nc, next_mask));
                        seen[nr, nc, next_mask] = true;
                    }
                }
            }
            moves++;
        }
        
        return -1;
    }
}
