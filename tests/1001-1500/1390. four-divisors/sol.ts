function sumFourDivisors(nums: number[]): number {
  if (nums.length === 0) return 0;
  const maxNum = Math.max(...nums);
  if (maxNum < 2) return 0;

  const sieve: boolean[] = new Array(maxNum + 1).fill(true);
  if (maxNum >= 0) sieve[0] = false;
  if (maxNum >= 1) sieve[1] = false;

  for (let p = 2; p * p <= maxNum; p++) {
    if (sieve[p]) {
      for (let multiple = p * p; multiple <= maxNum; multiple += p) {
        sieve[multiple] = false;
      }
    }
  }

  let total = 0;
  for (const x of nums) {
    // p^3 case
    const p = Math.round(Math.pow(x, 1 / 3));
    if (p >= 0 && p <= maxNum && p * p * p === x && sieve[p]) {
      total += 1 + p + p * p + x;
      continue;
    }

    // p * q case
    for (let i = 2; i * i <= x; i++) {
      if (x % i === 0) {
        const j = Math.floor(x / i);
        if (i !== j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j]) {
          total += 1 + i + j + x;
        }
        break;
      }
    }
  }
  return total;
}
