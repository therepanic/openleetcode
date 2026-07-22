function findGoodStrings(
  n: number,
  s1: string,
  s2: string,
  evil: string,
): number {
  const MOD = 1000000007;
  const m = evil.length;

  const lps: number[] = new Array(m).fill(0);
  for (let i = 1; i < m; i++) {
    let j = lps[i - 1];
    while (j > 0 && evil[i] !== evil[j]) {
      j = lps[j - 1];
    }
    if (evil[i] === evil[j]) {
      lps[i] = j + 1;
    }
  }

  function getNextState(currMatch: number, c: string): number {
    while (currMatch > 0 && c !== evil[currMatch]) {
      currMatch = lps[currMatch - 1];
    }
    if (c === evil[currMatch]) {
      currMatch++;
    }
    return currMatch;
  }

  const memo: number[][][][] = Array.from({ length: n + 1 }, () =>
    Array.from({ length: m + 1 }, () =>
      Array.from({ length: 2 }, () => new Array(2).fill(-1)),
    ),
  );

  function dp(
    idx: number,
    eIdx: number,
    tightLo: number,
    tightHi: number,
  ): number {
    if (eIdx === m) return 0;
    if (idx === n) return 1;

    if (memo[idx][eIdx][tightLo][tightHi] !== -1) {
      return memo[idx][eIdx][tightLo][tightHi];
    }

    let res = 0;
    const lower = tightLo === 1 ? s1[idx] : "a";
    const upper = tightHi === 1 ? s2[idx] : "z";

    for (
      let charCode = lower.charCodeAt(0);
      charCode <= upper.charCodeAt(0);
      charCode++
    ) {
      const c = String.fromCharCode(charCode);

      const nextEIdx = getNextState(eIdx, c);
      const nextTightLo = tightLo === 1 && c === lower ? 1 : 0;
      const nextTightHi = tightHi === 1 && c === upper ? 1 : 0;

      res = (res + dp(idx + 1, nextEIdx, nextTightLo, nextTightHi)) % MOD;
    }

    memo[idx][eIdx][tightLo][tightHi] = res;
    return res;
  }

  return dp(0, 0, 1, 1);
}
