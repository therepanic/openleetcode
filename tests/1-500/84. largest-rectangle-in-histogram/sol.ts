function largestRectangleArea(heights: number[]): number {
  const stack: number[] = [];
  let ans = 0;
  for (let i = 0; i <= heights.length; i++) {
    const cur = i === heights.length ? 0 : heights[i];
    while (stack.length > 0 && heights[stack[stack.length - 1]] > cur) {
      const h = heights[stack.pop()!];
      const left = stack.length === 0 ? -1 : stack[stack.length - 1];
      ans = Math.max(ans, h * (i - left - 1));
    }
    stack.push(i);
  }
  return ans;
}
