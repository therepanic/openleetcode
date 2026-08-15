function highestPeak(isWater: number[][]): number[][] {
  const r = isWater.length;
  const c = isWater[0].length;
  const height: number[][] = Array.from({ length: r }, () =>
    Array(c).fill(Number.MAX_SAFE_INTEGER),
  );

  for (let i = 0; i < r; i++) {
    for (let j = 0; j < c; j++) {
      if (isWater[i][j] === 1) {
        height[i][j] = 0;
      } else {
        if (i > 0) height[i][j] = Math.min(height[i][j], height[i - 1][j] + 1);
        if (j > 0) height[i][j] = Math.min(height[i][j], height[i][j - 1] + 1);
      }
    }
  }

  for (let i = r - 1; i >= 0; i--) {
    for (let j = c - 1; j >= 0; j--) {
      if (i < r - 1)
        height[i][j] = Math.min(height[i][j], height[i + 1][j] + 1);
      if (j < c - 1)
        height[i][j] = Math.min(height[i][j], height[i][j + 1] + 1);
    }
  }

  return height;
}
