function longestIncreasingPath(matrix: number[][]): number {
  const row = matrix.length;
  const col = matrix[0].length;
  const dp: number[][] = Array.from({ length: row }, () => Array(col).fill(0));

  function graph(i: number, j: number): number {
    if (dp[i][j] !== 0) {
      return dp[i][j];
    }

    let top = 0;
    let down = 0;
    let left = 0;
    let right = 0;

    if (i - 1 >= 0 && matrix[i - 1][j] > matrix[i][j]) {
      if (dp[i - 1][j] === 0) {
        dp[i - 1][j] = graph(i - 1, j);
      }
      top = dp[i - 1][j];
    }

    if (i + 1 < row && matrix[i + 1][j] > matrix[i][j]) {
      if (dp[i + 1][j] === 0) {
        dp[i + 1][j] = graph(i + 1, j);
      }
      down = dp[i + 1][j];
    }

    if (j - 1 >= 0 && matrix[i][j - 1] > matrix[i][j]) {
      if (dp[i][j - 1] === 0) {
        dp[i][j - 1] = graph(i, j - 1);
      }
      left = dp[i][j - 1];
    }

    if (j + 1 < col && matrix[i][j + 1] > matrix[i][j]) {
      if (dp[i][j + 1] === 0) {
        dp[i][j + 1] = graph(i, j + 1);
      }
      right = dp[i][j + 1];
    }

    dp[i][j] = 1 + Math.max(top, down, left, right);
    return dp[i][j];
  }

  let maxi = 0;
  for (let i = 0; i < row; i++) {
    for (let j = 0; j < col; j++) {
      const num = graph(i, j);
      maxi = Math.max(maxi, num);
    }
  }

  return maxi;
}
