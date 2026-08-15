function findRotation(mat: number[][], target: number[][]): boolean {
  for (let i = 0; i < 4; i++) {
    if (JSON.stringify(mat) === JSON.stringify(target)) return true;
    mat = rotate(mat);
  }
  return false;
}

function rotate(mat: number[][]): number[][] {
  const n = mat.length;
  const res: number[][] = Array.from({ length: n }, () => Array(n).fill(0));
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      res[j][n - 1 - i] = mat[i][j];
    }
  }
  return res;
}
