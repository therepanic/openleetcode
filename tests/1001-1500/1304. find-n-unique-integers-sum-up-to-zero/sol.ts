function sumZero(n: number): number[] {
  return Array.from({ length: n }, (_, i) => i * 2 - n + 1);
}
