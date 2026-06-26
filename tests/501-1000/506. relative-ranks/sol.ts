function findRelativeRanks(score: number[]): string[] {
  const n = score.length;
  const sorted = [...score].sort((a, b) => b - a);
  const ranks: { [key: number]: string } = {};
  for (let i = 0; i < n; i++) {
    ranks[sorted[i]] = (i + 1).toString();
  }
  ranks[sorted[0]] = "Gold Medal";
  if (n > 1) ranks[sorted[1]] = "Silver Medal";
  if (n > 2) ranks[sorted[2]] = "Bronze Medal";
  return score.map((s) => ranks[s]);
}
