function isNStraightHand(hand: number[], groupSize: number): boolean {
  const hashmap: Map<number, number> = new Map();
  for (const h of hand) {
    hashmap.set(h, (hashmap.get(h) || 0) + 1);
  }

  const minHeap: number[] = Array.from(hashmap.keys()).sort((a, b) => a - b);
  let idx = 0;

  while (idx < minHeap.length) {
    const first = minHeap[idx];
    for (let i = first; i < first + groupSize; i++) {
      if (!hashmap.has(i)) {
        return false;
      }
      hashmap.set(i, hashmap.get(i)! - 1);
      if (hashmap.get(i) === 0) {
        if (i !== minHeap[idx]) {
          return false;
        }
        idx++;
      }
    }
  }
  return true;
}
