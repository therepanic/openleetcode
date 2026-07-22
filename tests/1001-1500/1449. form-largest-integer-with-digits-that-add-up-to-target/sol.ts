function largestNumber(cost: number[], target: number): string {
  const N = cost.length;
  const memo: number[][] = Array.from({ length: N + 1 }, () =>
    Array(target + 1).fill(-1),
  );

  const helper = (i: number, c: number): number => {
    if (c === 0) return 0;
    if (i === N || c < 0) return -Infinity;
    if (memo[i][c] !== -1) return memo[i][c];
    let take = helper(i, c - cost[i]);
    if (take !== -Infinity) take += 1;
    const notTake = helper(i + 1, c);
    memo[i][c] = Math.max(take, notTake);
    return memo[i][c];
  };

  const e = helper(0, target);
  if (e === -Infinity) return "0";

  let t = target;
  let s = "";
  for (let k = 0; k < e; k++) {
    for (let j = 9; j >= 1; j--) {
      if (cost[j - 1] <= t && helper(0, t - cost[j - 1]) === e - k - 1) {
        t -= cost[j - 1];
        s += j.toString();
        break;
      }
    }
  }
  return s;
}
