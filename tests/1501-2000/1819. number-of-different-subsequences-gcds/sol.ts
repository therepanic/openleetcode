function countDifferentSubsequenceGCDs(nums: number[]): number {
  const seen = new Set(nums);
  const maxi = Math.max(...nums);
  let cnt = 0;
  for (let i = 1; i <= maxi; i++) {
    let gd = 0;
    for (let j = i; j <= maxi; j += i) {
      if (seen.has(j)) {
        gd = gcd(gd, j);
      }
    }
    if (gd === i) cnt++;
  }
  return cnt;
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    [a, b] = [b, a % b];
  }
  return a;
}
