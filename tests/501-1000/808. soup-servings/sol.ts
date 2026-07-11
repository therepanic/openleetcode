function soupServings(n: number): number {
  if (n > 5000) {
    return 1.0;
  }
  const units = Math.ceil(n / 25);
  const memo: Map<string, number> = new Map();

  function calcProb(soupA: number, soupB: number): number {
    const key = `${soupA},${soupB}`;
    if (memo.has(key)) {
      return memo.get(key)!;
    }
    if (soupA <= 0 && soupB <= 0) {
      return 0.5;
    }
    if (soupA <= 0) {
      return 1.0;
    }
    if (soupB <= 0) {
      return 0.0;
    }
    const result =
      0.25 *
      (calcProb(soupA - 4, soupB) +
        calcProb(soupA - 3, soupB - 1) +
        calcProb(soupA - 2, soupB - 2) +
        calcProb(soupA - 1, soupB - 3));
    memo.set(key, result);
    return result;
  }

  return calcProb(units, units);
}
