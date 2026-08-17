function maximumWealth(accounts: number[][]): number {
  let rich = 0;
  for (let i of accounts) {
    rich = Math.max(
      rich,
      i.reduce((a, b) => a + b, 0),
    );
  }
  return rich;
}
