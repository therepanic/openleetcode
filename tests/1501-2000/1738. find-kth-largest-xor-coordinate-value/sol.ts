function kthLargestValue(matrix: number[][], k: number): number {
  const n = matrix.length;
  const m = matrix[0].length;
  const temp: number[][] = Array.from({ length: n }, () => Array(m).fill(0));
  temp[0][0] = matrix[0][0];
  for (let j = 1; j < m; j++) temp[0][j] = temp[0][j - 1] ^ matrix[0][j];
  for (let i = 1; i < n; i++) temp[i][0] = temp[i - 1][0] ^ matrix[i][0];
  for (let i = 1; i < n; i++) {
    for (let j = 1; j < m; j++) {
      temp[i][j] =
        matrix[i][j] ^ temp[i - 1][j] ^ temp[i][j - 1] ^ temp[i - 1][j - 1];
    }
  }
  const arr: number[] = temp.flat();
  arr.sort((a, b) => b - a);
  return arr[k - 1];
}
