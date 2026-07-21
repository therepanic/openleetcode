function findTheLongestSubstring(s: string): number {
  const mapy: number[] = new Array(32).fill(-2);
  mapy[0] = -1;

  let res = 0;
  let mask = 0;

  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "a") mask ^= 1;
    else if (c === "e") mask ^= 2;
    else if (c === "i") mask ^= 4;
    else if (c === "o") mask ^= 8;
    else if (c === "u") mask ^= 16;

    const prev = mapy[mask];
    if (prev === -2) {
      mapy[mask] = i;
    } else {
      res = Math.max(res, i - prev);
    }
  }

  return res;
}
