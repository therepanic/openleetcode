function checkZeroOnes(s: string): boolean {
  let max1 = 0,
    max0 = 0;
  let one = 0,
    zero = 0;

  for (const ch of s) {
    if (ch === "1") {
      one++;
      zero = 0;
      max1 = Math.max(max1, one);
    } else {
      zero++;
      one = 0;
      max0 = Math.max(max0, zero);
    }
  }

  return max1 > max0;
}
