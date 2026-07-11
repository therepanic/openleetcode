function superEggDrop(k: number, n: number): number {
  const memo: number[][] = Array.from({ length: k + 1 }, () =>
    Array(n + 1).fill(-1),
  );

  function solve(eggs: number, floors: number): number {
    if (floors <= 1 || eggs === 1) return floors;
    if (memo[eggs][floors] !== -1) return memo[eggs][floors];

    let low = 1,
      high = floors;
    let ans = floors;

    while (low <= high) {
      const mid = Math.floor((low + high) / 2);
      const breakCase = solve(eggs - 1, mid - 1);
      const notBreakCase = solve(eggs, floors - mid);

      ans = Math.min(ans, 1 + Math.max(breakCase, notBreakCase));
      if (breakCase < notBreakCase) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    memo[eggs][floors] = ans;
    return ans;
  }

  return solve(k, n);
}
