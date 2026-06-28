function repeatedStringMatch(a: string, b: string): number {
  let repeatA = a;
  let count = 1;

  while (repeatA.length < b.length) {
    repeatA += a;
    count++;
    if (repeatA.includes(b)) {
      return count;
    }
  }

  repeatA += a;
  count++;
  if (repeatA.includes(b)) {
    return count;
  }

  return -1;
}
