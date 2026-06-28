function numRabbits(answers: number[]): number {
  const mpp: Map<number, number> = new Map();
  for (const a of answers) {
    mpp.set(a, (mpp.get(a) || 0) + 1);
  }
  let total = 0;
  mpp.forEach((count, x) => {
    total += Math.ceil(count / (x + 1)) * (x + 1);
  });
  return total;
}
