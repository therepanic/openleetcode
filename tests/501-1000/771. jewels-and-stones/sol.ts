function numJewelsInStones(jewels: string, stones: string): number {
  let count = 0;
  for (const i of jewels) {
    if (stones.includes(i)) {
      count += stones.split("").filter((s) => s === i).length;
    }
  }
  return count;
}
