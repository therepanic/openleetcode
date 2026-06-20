function canIWin(maxChoosableInteger: number, desiredTotal: number): boolean {
  if (desiredTotal <= 0) return true;
  const sum = (maxChoosableInteger * (maxChoosableInteger + 1)) / 2;
  if (sum < desiredTotal) return false;

  const memo: Map<number, boolean> = new Map();

  function canWin(state: number, total: number): boolean {
    if (memo.has(state)) return memo.get(state)!;

    for (let i = 1; i <= maxChoosableInteger; i++) {
      const bit = 1 << (i - 1);
      if ((state & bit) === 0) {
        if (i >= total || !canWin(state | bit, total - i)) {
          memo.set(state, true);
          return true;
        }
      }
    }
    memo.set(state, false);
    return false;
  }

  return canWin(0, desiredTotal);
}
