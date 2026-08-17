function minDifference(nums: number[], queries: number[][]): number[] {
  const maxVal = Math.max(...nums);
  const p: number[][] = Array.from({ length: nums.length + 1 }, () =>
    Array(maxVal + 1).fill(0),
  );
  for (let j = 0; j <= maxVal; j++) p[0][j] = 0;
  for (let i = 0; i < nums.length; i++) {
    for (let j = 0; j <= maxVal; j++) {
      p[i + 1][j] = p[i][j] + (nums[i] === j ? 1 : 0);
    }
  }
  const res: number[] = [];
  for (const [l, r] of queries) {
    const diff: number[] = Array(maxVal + 1).fill(0);
    for (let j = 0; j <= maxVal; j++) diff[j] = p[r + 1][j] - p[l][j];
    let prev = -1;
    let best = -1;
    for (let j = 0; j <= maxVal; j++) {
      if (diff[j] > 0) {
        if (prev >= 0) {
          if (best === -1 || j - prev < best) best = j - prev;
        }
        prev = j;
      }
    }
    res.push(best);
  }
  return res;
}
