function diagonalSort(mat: number[][]): number[][] {
  const m = mat.length,
    n = mat[0].length;
  const diagonals: Map<number, number[]> = new Map();

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const key = i - j;
      if (!diagonals.has(key)) {
        diagonals.set(key, []);
      }
      diagonals.get(key)!.push(mat[i][j]);
    }
  }

  for (const list of diagonals.values()) {
    list.sort((a, b) => b - a);
  }

  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      const list = diagonals.get(i - j)!;
      mat[i][j] = list.pop()!;
    }
  }

  return mat;
}
