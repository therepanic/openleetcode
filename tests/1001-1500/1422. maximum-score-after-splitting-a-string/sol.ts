function maxScore(s: string): number {
  let totalOnes = 0;
  for (const c of s) {
    if (c === "1") totalOnes++;
  }

  let zerosCount = 0;
  let onesCount = 0;
  let bestScore = -Infinity;

  for (let i = 0; i < s.length - 1; i++) {
    if (s[i] === "0") {
      zerosCount++;
    } else {
      onesCount++;
    }

    const currentScore = zerosCount + (totalOnes - onesCount);
    bestScore = Math.max(bestScore, currentScore);
  }

  return bestScore;
}
