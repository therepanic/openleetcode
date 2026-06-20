function maxSlidingWindow(nums: number[], k: number): number[] {
  const res: number[] = [];
  const q: number[] = [];
  for (let idx = 0; idx < nums.length; idx++) {
    const num = nums[idx];
    while (q.length && q[q.length - 1] < num) {
      q.pop();
    }
    q.push(num);
    if (idx >= k && nums[idx - k] === q[0]) {
      q.shift();
    }
    if (idx >= k - 1) {
      res.push(q[0]);
    }
  }
  return res;
}
