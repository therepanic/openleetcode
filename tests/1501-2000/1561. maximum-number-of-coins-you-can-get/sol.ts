function maxCoins(piles: number[]): number {
  piles.sort((a, b) => a - b);
  let l = 0;
  let r = piles.length;
  let count = 0;
  for (let i = 0; i < Math.floor(piles.length / 3); i++) {
    count += piles[r - 2];
    l += 1;
    r -= 2;
  }
  return count;
}
