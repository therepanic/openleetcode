function findDiagonalOrder(nums: number[][]): number[] {
  const l: [number, number, number][] = [];
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j < nums[i].length; j++) {
      l.push([i + j, i, j]);
    }
  }

  const h: { [key: number]: number[] } = {};
  for (const [sum, i, j] of l) {
    if (!h[sum]) h[sum] = [];
    h[sum].push(nums[i][j]);
  }

  const result: number[] = [];
  const sortedKeys = Object.keys(h)
    .map(Number)
    .sort((a, b) => a - b);
  for (const key of sortedKeys) {
    result.push(...h[key].reverse());
  }
  return result;
}
