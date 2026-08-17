using System;
using System.Collections.Generic;

public class Solution {
    private int m, n;
    private HashSet<int> walls = new HashSet<int>();
    private int food;
    private int catJump, mouseJump;
    private int[][] dirs = new int[][] { new int[] {-1,0}, new int[] {0,1}, new int[] {1,0}, new int[] {0,-1} };
    private Dictionary<int, bool> memo = new Dictionary<int, bool>();
    
    public bool CanMouseWin(string[] grid, int catJump, int mouseJump) {
        m = grid.Length;
        n = grid[0].Length;
        this.catJump = catJump;
        this.mouseJump = mouseJump;
        
        int cat = 0, mouse = 0;
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int idx = i * n + j;
                if (grid[i][j] == 'F') food = idx;
                else if (grid[i][j] == 'C') cat = idx;
                else if (grid[i][j] == 'M') mouse = idx;
                else if (grid[i][j] == '#') walls.Add(idx);
            }
        }
        
        return Dfs(cat, mouse, 0);
    }
    
    private int Key(int cat, int mouse, int turn) {
        return (cat * m * n + mouse) * (m * n * 2) + turn;
    }
    
    private bool Dfs(int cat, int mouse, int turn) {
        int key = Key(cat, mouse, turn);
        if (memo.ContainsKey(key)) return memo[key];
        
        int cx = cat / n, cy = cat % n;
        int mx = mouse / n, my = mouse % n;
        
        if (cat == food || cat == mouse || turn >= m * n * 2) {
            memo[key] = false;
            return false;
        }
        if (mouse == food) {
            memo[key] = true;
            return true;
        }
        
        bool result = false;
        if (turn % 2 == 0) { // mouse
            foreach (int[] d in dirs) {
                for (int jump = 0; jump <= mouseJump; jump++) {
                    int nx = mx + jump * d[0], ny = my + jump * d[1];
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.Contains(nx * n + ny)) break;
                    if (Dfs(cat, nx * n + ny, turn + 1)) {
                        result = true;
                        break;
                    }
                }
                if (result) break;
            }
        } else { // cat
            result = true;
            foreach (int[] d in dirs) {
                for (int jump = 0; jump <= catJump; jump++) {
                    int nx = cx + jump * d[0], ny = cy + jump * d[1];
                    if (nx < 0 || nx >= m || ny < 0 || ny >= n || walls.Contains(nx * n + ny)) break;
                    if (!Dfs(nx * n + ny, mouse, turn + 1)) {
                        result = false;
                        break;
                    }
                }
                if (!result) break;
            }
        }
        
        memo[key] = result;
        return result;
    }
}
