function maximalRectangle(matrix: string[][]): number {
  if (matrix.length === 0 || matrix[0].length === 0) return 0;
  const cols = matrix[0].length;
  const heights = new Array<number>(cols).fill(0);
  let ans = 0;
  for (const row of matrix) {
    for (let c = 0; c < cols; c++)
      heights[c] = row[c] === "1" ? heights[c] + 1 : 0;
    ans = Math.max(ans, largest(heights));
  }
  return ans;
}

function largest(heights: number[]): number {
  const stack: number[] = [];
  let best = 0;
  for (let i = 0; i <= heights.length; i++) {
    const cur = i === heights.length ? 0 : heights[i];
    while (stack.length > 0 && heights[stack[stack.length - 1]] > cur) {
      const h = heights[stack.pop()!];
      const left = stack.length === 0 ? -1 : stack[stack.length - 1];
      best = Math.max(best, h * (i - left - 1));
    }
    stack.push(i);
  }
  return best;
}
