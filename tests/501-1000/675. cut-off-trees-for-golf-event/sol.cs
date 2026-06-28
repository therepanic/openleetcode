public class Solution {
    public int CutOffTree(IList<IList<int>> forest) {
        int rows = forest.Count;
        int cols = forest[0].Count;
        
        if (forest[0][0] == 0) return -1;
        
        var trees = new List<(int height, int row, int col)>();
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (forest[r][c] > 1) {
                    trees.Add((forest[r][c], r, c));
                }
            }
        }
        
        trees.Sort((a, b) => a.height.CompareTo(b.height));
        
        int FindShortestPath(int startRow, int startCol, int targetRow, int targetCol) {
            int[][] directions = new int[][] { 
                new int[] { -1, 0 }, new int[] { 0, -1 }, 
                new int[] { 0, 1 }, new int[] { 1, 0 } 
            };
            var queue = new Queue<(int row, int col, int steps)>();
            var visited = new HashSet<(int, int)>();
            
            queue.Enqueue((startRow, startCol, 0));
            visited.Add((startRow, startCol));
            
            while (queue.Count > 0) {
                var (currRow, currCol, steps) = queue.Dequeue();
                
                if (currRow == targetRow && currCol == targetCol) {
                    return steps;
                }
                
                foreach (var dir in directions) {
                    int newRow = currRow + dir[0];
                    int newCol = currCol + dir[1];
                    
                    if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
                        forest[newRow][newCol] > 0 && !visited.Contains((newRow, newCol))) {
                        queue.Enqueue((newRow, newCol, steps + 1));
                        visited.Add((newRow, newCol));
                    }
                }
            }
            
            return -1;
        }
        
        int totalSteps = 0;
        int currentRow = 0, currentCol = 0;
        
        foreach (var (_, targetRow, targetCol) in trees) {
            int steps = FindShortestPath(currentRow, currentCol, targetRow, targetCol);
            if (steps == -1) return -1;
            
            totalSteps += steps;
            currentRow = targetRow;
            currentCol = targetCol;
        }
        
        return totalSteps;
    }
}
