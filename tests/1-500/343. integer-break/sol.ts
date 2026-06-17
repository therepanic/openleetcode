function integerBreak(n: number): number {
  if (n === 2) {
    return 1;
  }
  if (n === 3) {
    return 2;
  }

  let threes = Math.floor(n / 3);
  let remainder = n % 3;

  if (remainder === 1) {
    threes -= 1;
    remainder = 4;
  } else if (remainder === 0) {
    remainder = 1;
  }

  return Math.pow(3, threes) * remainder;
}
