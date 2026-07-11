function leastOpsExpressTarget(x: number, target: number): number {
  const memo: Map<number, number> = new Map();

  function dfs(val: number): number {
    if (memo.has(val)) return memo.get(val)!;
    if (val < x) {
      const res = Math.min(2 * val - 1, 2 * (x - val));
      memo.set(val, res);
      return res;
    }

    const k = Math.floor(Math.log(val) / Math.log(x));
    const pow = Math.pow(x, k);
    let ans = k + dfs(val - pow);

    const nextPow = pow * x;
    if (nextPow < 2 * val) {
      ans = Math.min(ans, k + 1 + dfs(nextPow - val));
    }

    memo.set(val, ans);
    return ans;
  }

  return dfs(target);
}
