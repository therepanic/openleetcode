function kConcatenationMaxSum(arr: number[], k: number): number {
  const MOD = 1000000007;

  const kadanes = (nums: number[]): number => {
    let best = 0;
    let total = 0;
    for (const x of nums) {
      total += x;
      if (total < 0) total = 0;
      best = Math.max(best, total);
    }
    return best;
  };

  if (k <= 3) {
    const extended: number[] = [];
    for (let i = 0; i < k; i++) {
      extended.push(...arr);
    }
    return kadanes(extended) % MOD;
  }

  const sum = arr.reduce((a, b) => a + b, 0);
  const s = Math.max(0, sum * (k - 1)) % MOD;

  const doubleArr = [...arr, ...arr];

  return Math.max(s + kadanes(arr), kadanes(doubleArr)) % MOD;
}
