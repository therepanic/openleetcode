function preimageSizeFZF(k: number): number {
  function trailingZeroes(n: number): number {
    let count = 0;
    let power = 5;
    while (power <= n) {
      count += Math.floor(n / power);
      power *= 5;
    }
    return count;
  }

  let start = k * 4;
  while (true) {
    const H = trailingZeroes(start);
    if (H === k) {
      return 5;
    }
    if (H > k) {
      break;
    }
    start++;
  }
  return 0;
}
