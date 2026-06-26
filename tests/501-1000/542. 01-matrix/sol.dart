class Solution {
  List<List<int>> updateMatrix(List<List<int>> mat) {
    int rows = mat.length;
    int cols = mat[0].length;
    List<List<int>> directions = [[0, 1], [0, -1], [1, 0], [-1, 0]];
    Queue<List<int>> queue = Queue();

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (mat[i][j] == 0) {
          queue.add([i, j]);
        } else {
          mat[i][j] = 0x7fffffff;
        }
      }
    }

    while (queue.isNotEmpty) {
      List<int> cell = queue.removeFirst();
      int row = cell[0];
      int col = cell[1];

      for (List<int> dir in directions) {
        int newRow = row + dir[0];
        int newCol = col + dir[1];

        if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && mat[newRow][newCol] > mat[row][col] + 1) {
          mat[newRow][newCol] = mat[row][col] + 1;
          queue.add([newRow, newCol]);
        }
      }
    }

    return mat;
  }
}
