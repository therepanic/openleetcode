public class Solution {
    public int MinDays(int[][] grid) {
        int CountIslands() {
            int rows = grid.Length, cols = grid[0].Length;
            bool[,] seen = new bool[rows, cols];
            int islands = 0;
            int[,] dirs = {{-1,0},{1,0},{0,-1},{0,1}};
            
            for (int i = 0; i < rows; i++) {
                for (int j = 0; j < cols; j++) {
                    if (grid[i][j] == 1 && !seen[i,j]) {
                        islands++;
                        var stack = new Stack<(int,int)>();
                        stack.Push((i,j));
                        seen[i,j] = true;
                        while (stack.Count > 0) {
                            var (x,y) = stack.Pop();
                            for (int d = 0; d < 4; d++) {
                                int nx = x + dirs[d,0], ny = y + dirs[d,1];
                                if (nx >= 0 && nx < rows && ny >= 0 && ny < cols && grid[nx][ny] == 1 && !seen[nx,ny]) {
                                    seen[nx,ny] = true;
                                    stack.Push((nx,ny));
                                }
                            }
                        }
                    }
                }
            }
            return islands;
        }
        
        if (CountIslands() != 1) return 0;
        
        for (int i = 0; i < grid.Length; i++) {
            for (int j = 0; j < grid[0].Length; j++) {
                if (grid[i][j] == 1) {
                    grid[i][j] = 0;
                    if (CountIslands() != 1) return 1;
                    grid[i][j] = 1;
                }
            }
        }
        return 2;
    }
}
