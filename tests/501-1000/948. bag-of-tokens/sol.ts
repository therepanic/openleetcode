function bagOfTokensScore(tokens: number[], power: number): number {
  tokens.sort((a, b) => a - b);
  const n = tokens.length;
  let l = 0;
  let curr = 0;

  while (l < n && tokens[l] <= power) {
    power -= tokens[l];
    l++;
    curr++;
  }

  let r = n - 1;
  let res = curr;

  while (l < r && curr > 0) {
    power += tokens[r];
    curr--;
    r--;

    while (l <= r && tokens[l] <= power) {
      power -= tokens[l];
      l++;
      curr++;
    }
    res = Math.max(res, curr);
  }

  return res;
}
