function maxResult(nums: number[], k: number): number {
  const n = nums.length;
  const dp = new Array(n).fill(0);
  dp[0] = nums[0];
  const dq: number[] = [0];
  let head = 0;
  for (let i = 1; i < n; i++) {
    if (dq[head] < i - k) {
      head++;
    }
    dp[i] = nums[i] + dp[dq[head]];
    while (dq.length > head && dp[dq[dq.length - 1]] <= dp[i]) {
      dq.pop();
    }
    dq.push(i);
  }
  return dp[n - 1];
}
