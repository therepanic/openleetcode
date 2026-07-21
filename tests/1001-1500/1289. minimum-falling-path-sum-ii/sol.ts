function minFallingPathSum(grid: number[][]): number {
  const n = grid.length;
  let dp = [...grid[0]];
  for (let i = 1; i < n; i++) {
    let smallest = Infinity;
    let secondSmallest = Infinity;
    let smallestCol = -1;
    for (let col = 0; col < n; col++) {
      const value = dp[col];
      if (value < smallest) {
        secondSmallest = smallest;
        smallest = value;
        smallestCol = col;
      } else if (value < secondSmallest) {
        secondSmallest = value;
      }
    }
    dp = grid[i].map(
      (value, col) => value + (col === smallestCol ? secondSmallest : smallest),
    );
  }
  return Math.min(...dp);
}
