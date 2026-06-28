function countPrimeSetBits(left: number, right: number): number {
  let count = 0;
  for (let i = left; i <= right; i++) {
    const setBits = i
      .toString(2)
      .split("")
      .filter((c) => c === "1").length;
    if (isPrime(setBits)) {
      count++;
    }
  }
  return count;
}

function isPrime(n: number): boolean {
  if (n <= 1) return false;
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) return false;
  }
  return true;
}
