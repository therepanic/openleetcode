function numTimesAllBlue(flips: number[]): number {
  let res = 0;
  let maxFlips = 0;

  for (let i = 0; i < flips.length; i++) {
    maxFlips = Math.max(maxFlips, flips[i]);
    if (maxFlips === i + 1) {
      res++;
    }
  }

  return res;
}
