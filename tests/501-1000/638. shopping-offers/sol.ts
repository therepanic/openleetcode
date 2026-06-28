function shoppingOffers(
  price: number[],
  special: number[][],
  needs: number[],
): number {
  const p = price.length;
  const memo = new Map<string, number>();

  function dp(curr: number[]): number {
    if (curr.every((i) => i === 0)) return 0;
    const key = curr.toString();
    if (memo.has(key)) return memo.get(key)!;

    const n = curr.length;
    let res = 0;
    for (let i = 0; i < p; i++) {
      res += curr[i] * price[i];
    }

    for (const offer of special) {
      let canUse = true;
      for (let i = 0; i < n; i++) {
        if (curr[i] < offer[i]) {
          canUse = false;
          break;
        }
      }
      if (canUse) {
        const newCurr = curr.map((val, i) => val - offer[i]);
        res = Math.min(res, offer[offer.length - 1] + dp(newCurr));
      }
    }

    memo.set(key, res);
    return res;
  }

  return dp(needs);
}
