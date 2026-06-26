function checkPerfectNumber(num: number): boolean {
  if (num === 1) return false;
  let count = 1;
  for (let i = 2; i * i <= num; i++) {
    if (num % i === 0) {
      count += i + Math.floor(num / i);
    }
  }
  return num === count;
}
