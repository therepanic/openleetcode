class Solution {
    public int cutOffTree(int[][] forest) {
        int rows = forest.length;
        int cols = forest[0].length;
        
        if (forest[0][0] == 0) {
            return -1;
        }
        
        List<int[]> trees = new ArrayList<>();
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                int val = forest[r][c];
                if (val > 1) {
                    trees.add(new int[]{val, r, c});
                }
            }
        }
        
        trees.sort((a, b) -> Integer.compare(a[0], b[0]));
        
        int totalSteps = 0;
        int currentRow = 0, currentCol = 0;
        
        for (int[] tree : trees) {
            int targetRow = tree[1];
            int targetCol = tree[2];
            
            int steps = findShortestPath(forest, currentRow, currentCol, targetRow, targetCol, rows, cols);
            if (steps == -1) {
                return -1;
            }
            
            totalSteps += steps;
            currentRow = targetRow;
            currentCol = targetCol;
        }
        
        return totalSteps;
    }
    
    private int findShortestPath(int[][] forest, int startRow, int startCol, 
                                  int targetRow, int targetCol, int rows, int cols) {
        int[][] directions = {{-1, 0}, {0, -1}, {0, 1}, {1, 0}};
        Queue<int[]> queue = new LinkedList<>();
        boolean[][] visited = new boolean[rows][cols];
        
        queue.offer(new int[]{startRow, startCol, 0});
        visited[startRow][startCol] = true;
        
        while (!queue.isEmpty()) {
            int[] curr = queue.poll();
            int currRow = curr[0], currCol = curr[1], steps = curr[2];
            
            if (currRow == targetRow && currCol == targetCol) {
                return steps;
            }
            
            for (int[] dir : directions) {
                int newRow = currRow + dir[0];
                int newCol = currCol + dir[1];
                
                if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
                    forest[newRow][newCol] > 0 && !visited[newRow][newCol]) {
                    queue.offer(new int[]{newRow, newCol, steps + 1});
                    visited[newRow][newCol] = true;
                }
            }
        }
        
        return -1;
    }
}
