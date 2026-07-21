function maxJumps(arr: number[], d: number): number {
  const n = arr.length;
  const dp: number[] = new Array(n).fill(-1);

  function dfs(i: number): number {
    if (dp[i] !== -1) return dp[i];

    let best = 1;

    // Right scan
    for (let nxt = i + 1; nxt <= Math.min(n - 1, i + d); nxt++) {
      if (arr[nxt] >= arr[i]) break;
      best = Math.max(best, 1 + dfs(nxt));
    }

    // Left scan
    for (let nxt = i - 1; nxt >= Math.max(0, i - d); nxt--) {
      if (arr[nxt] >= arr[i]) break;
      best = Math.max(best, 1 + dfs(nxt));
    }

    dp[i] = best;
    return dp[i];
  }

  let result = 0;
  for (let i = 0; i < n; i++) {
    result = Math.max(result, dfs(i));
  }
  return result;
}
