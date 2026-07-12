function fairCandySwap(aliceSizes: number[], bobSizes: number[]): number[] {
  const sumA = aliceSizes.reduce((a, b) => a + b, 0);
  const sumB = bobSizes.reduce((a, b) => a + b, 0);
  const diff = Math.floor((sumB - sumA) / 2);
  const setB = new Set(bobSizes);
  for (const a of aliceSizes) {
    if (setB.has(a + diff)) {
      return [a, a + diff];
    }
  }
  return [];
}
