function minCostToMoveChips(position: number[]): number {
  let even = 0,
    odd = 0;
  for (const i of position) {
    if (i % 2 === 0) {
      even++;
    } else {
      odd++;
    }
  }
  return Math.min(even, odd);
}
