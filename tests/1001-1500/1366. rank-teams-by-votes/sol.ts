function rankTeams(votes: string[]): string {
  const teams = votes[0];
  const n = teams.length;
  const positions: Record<string, number[]> = {};
  for (const team of teams) {
    positions[team] = new Array(n).fill(0);
  }
  for (const vote of votes) {
    for (let i = 0; i < n; i++) {
      const team = vote[i];
      positions[team][i]++;
    }
  }
  const sortedTeams = teams.split("").sort((a, b) => {
    const countsA = positions[a];
    const countsB = positions[b];
    for (let i = 0; i < n; i++) {
      if (countsA[i] !== countsB[i]) {
        return countsB[i] - countsA[i];
      }
    }
    return a.charCodeAt(0) - b.charCodeAt(0);
  });
  return sortedTeams.join("");
}
