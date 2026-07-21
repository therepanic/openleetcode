function minimumSwap(s1: string, s2: string): number {
  const n = s1.length;
  let s1X = 0;
  let s1Y = 0;
  for (let i = 0; i < n; i++) {
    if (s1[i] === s2[i]) continue;
    if (s1[i] === "x") {
      s1X++;
    } else {
      s1Y++;
    }
  }

  if (s1X % 2 !== s1Y % 2) return -1;

  const swaps = Math.floor(s1X / 2) + Math.floor(s1Y / 2);
  return s1X % 2 === 0 ? swaps : swaps + 2;
}
