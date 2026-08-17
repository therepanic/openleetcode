function minStoneSum(piles: number[], k: number): number {
  const maxHeap: number[] = [];
  for (const p of piles) {
    maxHeap.push(p);
  }
  maxHeap.sort((a, b) => b - a);
  for (let i = 0; i < k; i++) {
    const x = maxHeap[0];
    const reduced = Math.ceil(x / 2);
    maxHeap[0] = reduced;
    let idx = 0;
    while (true) {
      const left = idx * 2 + 1;
      if (left >= maxHeap.length) break;
      const right = left + 1;
      const child =
        right < maxHeap.length && maxHeap[right] > maxHeap[left] ? right : left;
      if (maxHeap[idx] >= maxHeap[child]) break;
      [maxHeap[idx], maxHeap[child]] = [maxHeap[child], maxHeap[idx]];
      idx = child;
    }
  }
  return maxHeap.reduce((a, b) => a + b, 0);
}
