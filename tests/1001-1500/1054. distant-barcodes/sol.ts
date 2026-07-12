function rearrangeBarcodes(barcodes: number[]): number[] {
  const h: Map<number, number> = new Map();
  for (const i of barcodes) {
    h.set(i, (h.get(i) || 0) + 1);
  }
  const heap: [number, number][] = [];
  for (const [k, v] of h) {
    heap.push([-v, k]);
  }
  heap.sort((a, b) => a[0] - b[0]);
  const l: number[] = [];
  while (heap.length > 1) {
    const x = heap.shift()!;
    const y = heap.shift()!;
    l.push(x[1]);
    l.push(y[1]);
    x[0]++;
    y[0]++;
    if (x[0] !== 0) {
      heap.push(x);
      heap.sort((a, b) => a[0] - b[0]);
    }
    if (y[0] !== 0) {
      heap.push(y);
      heap.sort((a, b) => a[0] - b[0]);
    }
  }
  if (heap.length > 0) {
    l.push(heap[0][1]);
  }
  return l;
}
