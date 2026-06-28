class Solution {
  int cutOffTree(List<List<int>> forest) {
    int rows = forest.length;
    int cols = forest[0].length;
    
    if (forest[0][0] == 0) return -1;
    
    List<List<int>> trees = [];
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (forest[r][c] > 1) {
          trees.add([forest[r][c], r, c]);
        }
      }
    }
    
    trees.sort((a, b) => a[0].compareTo(b[0]));
    
    int findShortestPath(int startRow, int startCol, int targetRow, int targetCol) {
      List<List<int>> directions = [[-1, 0], [0, -1], [0, 1], [1, 0]];
      Queue<List<int>> queue = Queue();
      Set<String> visited = {};
      
      queue.add([startRow, startCol, 0]);
      visited.add('$startRow,$startCol');
      
      while (queue.isNotEmpty) {
        List<int> curr = queue.removeFirst();
        int currRow = curr[0], currCol = curr[1], steps = curr[2];
        
        if (currRow == targetRow && currCol == targetCol) {
          return steps;
        }
        
        for (var dir in directions) {
          int newRow = currRow + dir[0];
          int newCol = currCol + dir[1];
          
          if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols &&
              forest[newRow][newCol] > 0 && !visited.contains('$newRow,$newCol')) {
            queue.add([newRow, newCol, steps + 1]);
            visited.add('$newRow,$newCol');
          }
        }
      }
      
      return -1;
    }
    
    int totalSteps = 0;
    int currentRow = 0, currentCol = 0;
    
    for (var tree in trees) {
      int targetRow = tree[1];
      int targetCol = tree[2];
      int steps = findShortestPath(currentRow, currentCol, targetRow, targetCol);
      
      if (steps == -1) return -1;
      
      totalSteps += steps;
      currentRow = targetRow;
      currentCol = targetCol;
    }
    
    return totalSteps;
  }
}
