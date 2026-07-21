function constrainedSubsetSum(nums: number[], k: number): number {
  const q: [number, number][] = [];
  let res = -Infinity;
  for (let i = 0; i < nums.length; i++) {
    const num = nums[i];
    const total = q.length === 0 ? num : num + q[0][1];
    res = Math.max(res, total);
    while (q.length > 0 && total >= q[q.length - 1][1]) {
      q.pop();
    }
    if (total > 0) {
      q.push([i, total]);
    }
    if (q.length > 0 && q[0][0] === i - k) {
      q.shift();
    }
  }
  return res;
}
