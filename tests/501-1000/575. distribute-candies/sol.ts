function distributeCandies(candyType: number[]): number {
  const n = candyType.length;
  const k = Math.floor(n / 2);
  const set = new Set(candyType);
  return Math.min(k, set.size);
}
