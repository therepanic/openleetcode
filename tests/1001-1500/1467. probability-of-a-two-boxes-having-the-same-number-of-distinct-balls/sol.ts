function getProbability(balls: number[]): number {
  const sm = balls.reduce((a, b) => a + b, 0);
  const expanded: number[] = [];
  balls.forEach((b, i) => {
    for (let j = 0; j < b; j++) {
      expanded.push(i);
    }
  });

  const memo = new Map<string, number>();

  function popCount(n: number): number {
    let count = 0;
    while (n) {
      count += n & 1;
      n >>>= 1;
    }
    return count;
  }

  function dp(i: number, cnt0: number, mask0: number, mask1: number): number {
    const key = `${i},${cnt0},${mask0},${mask1}`;
    if (memo.has(key)) return memo.get(key)!;

    const cnt1 = i - cnt0;
    if (cnt0 > sm / 2 || cnt1 > sm / 2) {
      memo.set(key, 0);
      return 0;
    }

    if (i === expanded.length) {
      const result = popCount(mask0) === popCount(mask1) ? 1 : 0;
      memo.set(key, result);
      return result;
    }

    const result =
      dp(i + 1, cnt0 + 1, mask0 | (1 << expanded[i]), mask1) +
      dp(i + 1, cnt0, mask0, mask1 | (1 << expanded[i]));
    memo.set(key, result);
    return result;
  }

  function comb(n: number, k: number): number {
    let res = 1;
    for (let i = 1; i <= k; i++) {
      res = (res * (n - k + i)) / i;
    }
    return res;
  }

  const favorable = dp(0, 0, 0, 0);
  const total = comb(sm, sm / 2);
  return favorable / total;
}
