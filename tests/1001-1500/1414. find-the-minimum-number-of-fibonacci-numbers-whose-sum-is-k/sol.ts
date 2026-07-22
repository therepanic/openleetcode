function findMinFibonacciNumbers(k: number): number {
  const fib: number[] = [1, 1];
  while (fib[fib.length - 1] <= k) {
    fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
  }

  let count = 0;
  let i = fib.length - 1;

  while (k > 0) {
    if (fib[i] <= k) {
      k -= fib[i];
      count++;
    }
    i--;
  }

  return count;
}
