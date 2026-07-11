function champagneTower(
  poured: number,
  query_row: number,
  query_glass: number,
): number {
  const tower: number[][] = Array.from({ length: 102 }, () =>
    Array(102).fill(0),
  );
  tower[0][0] = poured;

  for (let r = 0; r <= query_row; r++) {
    for (let c = 0; c <= r; c++) {
      if (tower[r][c] > 1) {
        const excess = (tower[r][c] - 1.0) / 2.0;
        tower[r][c] = 1;
        tower[r + 1][c] += excess;
        tower[r + 1][c + 1] += excess;
      }
    }
  }

  return tower[query_row][query_glass];
}
