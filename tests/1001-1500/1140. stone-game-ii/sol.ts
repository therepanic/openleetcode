function stoneGameII(piles: number[]): number {
  const n = piles.length;
  const suffix: number[] = new Array(n + 1).fill(0);
  for (let i = n - 1; i >= 0; i--) {
    suffix[i] = suffix[i + 1] + piles[i];
  }
  const memo: number[][] = Array.from({ length: n }, () =>
    new Array(n + 1).fill(-1),
  );

  function best(i: number, m: number): number {
    if (i >= n) return 0;
    if (memo[i][m] !== -1) return memo[i][m];
    let answer = 0;
    for (let x = 1; x <= Math.min(2 * m, n - i); x++) {
      answer = Math.max(answer, suffix[i] - best(i + x, Math.max(m, x)));
    }
    memo[i][m] = answer;
    return answer;
  }

  return best(0, 1);
}
