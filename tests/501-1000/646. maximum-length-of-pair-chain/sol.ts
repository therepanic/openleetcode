function findLongestChain(pairs: number[][]): number {
  pairs.sort((a, b) => a[1] - b[1]);
  let prev = pairs[0];
  let res = 1;
  for (let i = 1; i < pairs.length; i++) {
    const cur = pairs[i];
    if (cur[0] > prev[1]) {
      res++;
      prev = cur;
    }
  }
  return res;
}
