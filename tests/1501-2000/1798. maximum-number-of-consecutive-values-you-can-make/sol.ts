function getMaximumConsecutive(coins: number[]): number {
  coins.sort((a, b) => a - b);
  let maxConsecutive = 0;

  for (const coin of coins) {
    if (coin > maxConsecutive + 1) break;
    maxConsecutive += coin;
  }

  return maxConsecutive + 1;
}
