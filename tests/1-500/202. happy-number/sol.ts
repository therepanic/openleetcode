function isHappy(n: number): boolean {
  const seen = new Set<number>();
  while (n !== 1 && !seen.has(n)) {
    seen.add(n);
    n = nextValue(n);
  }
  return n === 1;
}

function nextValue(n: number): number {
  let total = 0;
  while (n > 0) {
    const digit = n % 10;
    total += digit * digit;
    n = Math.floor(n / 10);
  }
  return total;
}
