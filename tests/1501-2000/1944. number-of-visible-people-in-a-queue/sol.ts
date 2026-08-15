function canSeePersonsCount(heights: number[]): number[] {
  const n = heights.length;
  const result: number[] = new Array(n).fill(0);
  const stack: number[] = [];

  for (let i = n - 1; i >= 0; i--) {
    const height = heights[i];
    let visibility = 0;

    while (stack.length > 0 && height > stack[stack.length - 1]) {
      stack.pop();
      visibility++;
    }

    if (stack.length > 0) {
      visibility++;
    }

    result[i] = visibility;
    stack.push(height);
  }

  return result;
}
