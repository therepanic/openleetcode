function climbStairs(n: number): number {
  if (n <= 3) return n;
  let prev2 = 2;
  let prev1 = 3;
  for (let step = 4; step <= n; step++) {
    const cur = prev1 + prev2;
    prev2 = prev1;
    prev1 = cur;
  }
  return prev1;
}
