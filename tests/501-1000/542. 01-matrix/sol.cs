public class Solution {
    public int[][] UpdateMatrix(int[][] mat) {
        int rows = mat.Length;
        int cols = mat[0].Length;
        int[][] directions = new int[][] { new int[] { 0, 1 }, new int[] { 0, -1 }, new int[] { 1, 0 }, new int[] { -1, 0 } };
        Queue<(int, int)> queue = new Queue<(int, int)>();

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (mat[i][j] == 0) {
                    queue.Enqueue((i, j));
                } else {
                    mat[i][j] = int.MaxValue;
                }
            }
        }

        while (queue.Count > 0) {
            (int row, int col) = queue.Dequeue();

            foreach (int[] dir in directions) {
                int newRow = row + dir[0];
                int newCol = col + dir[1];

                if (newRow >= 0 && newRow < rows && newCol >= 0 && newCol < cols && mat[newRow][newCol] > mat[row][col] + 1) {
                    mat[newRow][newCol] = mat[row][col] + 1;
                    queue.Enqueue((newRow, newCol));
                }
            }
        }

        return mat;
    }
}
