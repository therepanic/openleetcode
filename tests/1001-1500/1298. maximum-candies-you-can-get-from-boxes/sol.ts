function maxCandies(
  status: number[],
  candies: number[],
  keys: number[][],
  containedBoxes: number[][],
  initialBoxes: number[],
): number {
  const owned = new Set<number>(initialBoxes);
  const opened = new Set<number>();
  let changed = true;
  let totalCandies = 0;
  while (changed) {
    changed = false;
    const ownedArr = Array.from(owned);
    for (const boxId of ownedArr) {
      if (opened.has(boxId) || status[boxId] === 0) continue;
      opened.add(boxId);
      changed = true;
      totalCandies += candies[boxId];
      for (const keyId of keys[boxId]) {
        status[keyId] = 1;
      }
      for (const box of containedBoxes[boxId]) {
        owned.add(box);
      }
    }
  }
  return totalCandies;
}
