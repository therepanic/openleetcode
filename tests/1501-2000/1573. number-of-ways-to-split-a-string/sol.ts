function numWays(s: string): number {
  const MOD = 1000000007;
  const totalOnes = s.split("").filter((c) => c === "1").length;

  if (totalOnes === 0) {
    const n = s.length;
    return (((n - 1) * (n - 2)) / 2) % MOD;
  }

  if (totalOnes % 3 !== 0) return 0;

  const onesPerPart = Math.floor(totalOnes / 3);
  let firstSplitWays = 0,
    secondSplitWays = 0,
    count = 0;

  for (const ch of s) {
    if (ch === "1") count++;
    if (count === onesPerPart) {
      firstSplitWays++;
    } else if (count === 2 * onesPerPart) {
      secondSplitWays++;
    }
  }

  return (firstSplitWays * secondSplitWays) % MOD;
}
