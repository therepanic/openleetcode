function furthestBuilding(
  heights: number[],
  bricks: number,
  ladders: number,
): number {
  const heap: number[] = [];
  const n = heights.length;
  const push = (val: number) => {
    heap.push(val);
    let i = heap.length - 1;
    while (i > 0) {
      const p = Math.floor((i - 1) / 2);
      if (heap[p] <= heap[i]) break;
      [heap[p], heap[i]] = [heap[i], heap[p]];
      i = p;
    }
  };
  const pop = (): number => {
    const result = heap[0];
    const last = heap.pop()!;
    if (heap.length > 0) {
      heap[0] = last;
      let i = 0;
      while (true) {
        let child = i * 2 + 1;
        if (child >= heap.length) break;
        if (child + 1 < heap.length && heap[child + 1] < heap[child]) child++;
        if (heap[i] <= heap[child]) break;
        [heap[i], heap[child]] = [heap[child], heap[i]];
        i = child;
      }
    }
    return result;
  };
  for (let i = 1; i < n; i++) {
    const climb = heights[i] - heights[i - 1];
    if (climb <= 0) continue;
    push(climb);
    if (heap.length > ladders) {
      const diff = pop();
      if (bricks >= diff) {
        bricks -= diff;
      } else {
        return i - 1;
      }
    }
  }
  return n - 1;
}
