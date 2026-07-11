function heightChecker(heights: number[]): number {
  let count = 0;
  const s = [...heights].sort((a, b) => a - b);
  for (let i = 0; i < heights.length; i++) {
    if (heights[i] !== s[i]) {
      count++;
    }
  }
  return count;
}
