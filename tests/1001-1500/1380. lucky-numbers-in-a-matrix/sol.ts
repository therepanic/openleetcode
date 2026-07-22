function luckyNumbers(matrix: number[][]): number[] {
  const rows = matrix.length;
  const cols = matrix[0].length;
  const ans: number[] = [];
  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      let ele1 = matrix[i][0];
      for (let k = 1; k < cols; k++) {
        if (matrix[i][k] < ele1) ele1 = matrix[i][k];
      }
      let ele2 = matrix[0][j];
      for (let k = 1; k < rows; k++) {
        if (matrix[k][j] > ele2) ele2 = matrix[k][j];
      }
      if (ele1 === matrix[i][j] && ele2 === matrix[i][j]) {
        ans.push(matrix[i][j]);
      }
    }
  }
  return ans;
}
