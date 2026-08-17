function maximumScore(a: number, b: number, c: number): number {
  const sum = a + b + c;
  return Math.min(sum - Math.max(a, b, c), Math.floor(sum / 2));
}
