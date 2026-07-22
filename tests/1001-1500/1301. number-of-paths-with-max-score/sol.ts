function pathsWithMaxScore(board: string[]): number[] {
  const MOD = 1_000_000_007;
  const n = board.length;

  let nextScore: number[] = new Array(n + 1).fill(-1);
  let nextWays: number[] = new Array(n + 1).fill(0);

  for (let i = n - 1; i >= 0; i--) {
    const currScore: number[] = new Array(n + 1).fill(-1);
    const currWays: number[] = new Array(n + 1).fill(0);

    const row = board[i];
    for (let j = n - 1; j >= 0; j--) {
      const cell = row[j];

      if (cell === "X") {
        continue;
      }

      if (cell === "S") {
        currScore[j] = 0;
        currWays[j] = 1;
        continue;
      }

      const best = Math.max(nextScore[j], currScore[j + 1], nextScore[j + 1]);

      if (best === -1) {
        continue;
      }

      let ways = 0;

      if (nextScore[j] === best) {
        ways = (ways + nextWays[j]) % MOD;
      }
      if (currScore[j + 1] === best) {
        ways = (ways + currWays[j + 1]) % MOD;
      }
      if (nextScore[j + 1] === best) {
        ways = (ways + nextWays[j + 1]) % MOD;
      }

      const value = cell === "E" ? 0 : parseInt(cell);

      currScore[j] = best + value;
      currWays[j] = ways;
    }

    nextScore = currScore;
    nextWays = currWays;
  }

  if (nextScore[0] === -1) {
    return [0, 0];
  }

  return [nextScore[0], nextWays[0]];
}
