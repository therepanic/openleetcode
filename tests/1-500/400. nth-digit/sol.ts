function findNthDigit(n: number): number {
  let i = 1;
  let count = 9;
  let start = 1;

  while (n > i * count) {
    n -= i * count;
    i++;
    count *= 10;
    start *= 10;
  }

  const number = start + Math.floor((n - 1) / i);
  return parseInt(String(number)[(n - 1) % i]);
}
