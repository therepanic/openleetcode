function countNegatives(grid: number[][]): number {
  let count = 0;
  for (const row of grid) {
    for (const num of row) {
      if (num < 0) count++;
    }
  }
  return count;
}
