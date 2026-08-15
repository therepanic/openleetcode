function stoneGameVI(aliceValues: number[], bobValues: number[]): number {
  const n = aliceValues.length;
  const combined: number[][] = [];
  for (let i = 0; i < n; i++) {
    combined.push([
      aliceValues[i] + bobValues[i],
      aliceValues[i],
      bobValues[i],
    ]);
  }
  combined.sort((a, b) => b[0] - a[0]);

  let alice = 0,
    bob = 0;
  for (let i = 0; i < n; i++) {
    if (i % 2 === 0) {
      alice += combined[i][1];
    } else {
      bob += combined[i][2];
    }
  }

  if (alice > bob) return 1;
  else if (alice < bob) return -1;
  else return 0;
}
