function minSwaps(grid: number[][]): number {
  const n = grid.length;
  const zeros: number[] = [];
  for (let i = 0; i < n; i++) {
    let count = 0;
    for (let j = n - 1; j >= 0; j--) {
      if (grid[i][j] === 0) {
        count++;
      } else {
        break;
      }
    }
    zeros.push(count);
  }
  let swaps = 0;
  for (let i = 0; i < n; i++) {
    const needed = n - i - 1;
    let j = i;
    while (j < n && zeros[j] < needed) {
      j++;
    }
    if (j === n) {
      return -1;
    }
    while (j > i) {
      [zeros[j], zeros[j - 1]] = [zeros[j - 1], zeros[j]];
      j--;
      swaps++;
    }
  }
  return swaps;
}
