function mostCompetitive(nums: number[], k: number): number[] {
  const stack: number[] = [];
  const n = nums.length;
  for (let i = 0; i < n; i++) {
    while (stack.length > 0 && stack[stack.length - 1] > nums[i]) {
      if (n - 1 - i >= k - stack.length) {
        stack.pop();
      } else {
        break;
      }
    }
    stack.push(nums[i]);
  }
  return stack.slice(0, k);
}
