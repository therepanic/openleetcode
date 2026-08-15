import java.util.*;

class Solution {
    private int m, n;
    private int[][] dirs = {{-1,0},{0,1},{1,0},{0,-1}};
    private Set<Integer> walls = new HashSet<>();
    private int[] food;
    private int catJump, mouseJump;
    private Map<Integer, Boolean> memo = new HashMap<>();

    public boolean canMouseWin(String[] grid, int catJump, int mouseJump) {
        m = grid.length;
        n = grid[0].length();
        this.catJump = catJump;
        this.mouseJump = mouseJump;
        
        int cat = -1, mouse = -1;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                char c = grid[i].charAt(j);
                if (c == 'F') food = new int[]{i, j};
                else if (c == 'C') cat = i * n + j;
                else if (c == 'M') mouse = i * n + j;
                else if (c == '#') walls.add(i * n + j);
            }
        }
        
        return dfs(cat, mouse, 0);
    }
    
    private int key(int cat, int mouse, int turn) {
        return ((cat * m * n + mouse) * (m * n * 2) + turn);
    }
    
    private boolean dfs(int cat, int mouse, int turn) {
        Integer k = key(cat, mouse, turn);
        if (memo.containsKey(k)) return memo.get(k);
        
        int cx = cat / n, cy = cat % n;
        int mx = mouse / n, my = mouse % n;
        
        if ((cat == food[0]*n + food[1]) || cat == mouse || turn >= m*n*2) {
            memo.put(k, false);
            return false;
        }
        if (mouse == food[0]*n + food[1]) {
            memo.put(k, true);
            return true;
        }
        
        boolean result;
        if (turn % 2 == 0) {  // mouse
            result = false;
            for (int[] d : dirs) {
                for (int jump = 0; jump <= mouseJump; jump++) {
                    int nx = mx + jump*d[0], ny = my + jump*d[1];
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx*n+ny)) break;
                    if (dfs(cat, nx*n+ny, turn+1)) {
                        result = true;
                        break;
                    }
                }
                if (result) break;
            }
        } else {  // cat
            result = true;
            for (int[] d : dirs) {
                for (int jump = 0; jump <= catJump; jump++) {
                    int nx = cx + jump*d[0], ny = cy + jump*d[1];
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.contains(nx*n+ny)) break;
                    if (!dfs(nx*n+ny, mouse, turn+1)) {
                        result = false;
                        break;
                    }
                }
                if (!result) break;
            }
        }
        
        memo.put(k, result);
        return result;
    }
}
