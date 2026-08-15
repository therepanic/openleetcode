function findGCD(nums: number[]): number {
  const a = Math.min(...nums);
  const b = Math.max(...nums);
  return gcd(a, b);
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    const temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}
