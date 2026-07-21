function minDifficulty(jobDifficulty: number[], d: number): number {
  const length = jobDifficulty.length;
  if (d > length) {
    return -1;
  }

  const minDifficulties: number[][] = Array.from({ length: d }, () =>
    Array(length).fill(Infinity),
  );

  let maxDiff = 0;
  let i = 0;
  while (i <= length - d) {
    maxDiff = Math.max(maxDiff, jobDifficulty[i]);
    minDifficulties[0][i] = maxDiff;
    i++;
  }

  let currentDay = 1;
  while (currentDay < d) {
    let to = currentDay;
    while (to <= length - d + currentDay) {
      let currentJobDifficulty = jobDifficulty[to];
      let result = Infinity;
      let j = to - 1;
      while (j >= currentDay - 1) {
        result = Math.min(
          result,
          minDifficulties[currentDay - 1][j] + currentJobDifficulty,
        );
        currentJobDifficulty = Math.max(currentJobDifficulty, jobDifficulty[j]);
        j--;
      }
      minDifficulties[currentDay][to] = result;
      to++;
    }
    currentDay++;
  }

  return minDifficulties[d - 1][length - 1];
}
