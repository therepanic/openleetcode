function shortestSubarray(nums: number[], k: number): number {
  const n = nums.length;
  const prefix: number[] = [0];
  for (let i = 0; i < n; i++) {
    prefix.push(prefix[prefix.length - 1] + nums[i]);
  }

  let best = n + 1;
  const dq: number[] = [];
  for (let i = 0; i < prefix.length; i++) {
    while (dq.length > 0 && prefix[i] - prefix[dq[0]] >= k) {
      best = Math.min(best, i - dq.shift()!);
    }
    while (dq.length > 0 && prefix[dq[dq.length - 1]] >= prefix[i]) {
      dq.pop();
    }
    dq.push(i);
  }

  return best === n + 1 ? -1 : best;
}
