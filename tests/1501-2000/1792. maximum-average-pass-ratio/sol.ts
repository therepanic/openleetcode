function maxAverageRatio(classes: number[][], extraStudents: number): number {
  const gain = (p: number, t: number) => (p + 1) / (t + 1) - p / t;
  const pq: [number, number, number][] = [];
  for (const [p, t] of classes) {
    pq.push([-gain(p, t), p, t]);
  }
  // simple priority queue using binary heap
  const heap = new MinHeap();
  for (const item of pq) heap.push(item);
  for (let i = 0; i < extraStudents; i++) {
    const [g, p, t] = heap.pop();
    const np = p + 1,
      nt = t + 1;
    heap.push([-gain(np, nt), np, nt]);
  }
  const items = heap.toArray();
  let sum = 0;
  for (const [_, p, t] of items) sum += p / t;
  return sum / classes.length;
}

class MinHeap {
  private heap: [number, number, number][] = [];
  push(val: [number, number, number]) {
    this.heap.push(val);
    this.bubbleUp(this.heap.length - 1);
  }
  pop() {
    if (this.heap.length === 0) return null;
    const top = this.heap[0];
    const last = this.heap.pop()!;
    if (this.heap.length > 0) {
      this.heap[0] = last;
      this.bubbleDown(0);
    }
    return top;
  }
  toArray() {
    return this.heap;
  }
  private bubbleUp(i: number) {
    while (i > 0) {
      const parent = Math.floor((i - 1) / 2);
      if (this.heap[i][0] < this.heap[parent][0]) {
        [this.heap[i], this.heap[parent]] = [this.heap[parent], this.heap[i]];
        i = parent;
      } else break;
    }
  }
  private bubbleDown(i: number) {
    const n = this.heap.length;
    while (true) {
      let left = 2 * i + 1,
        right = 2 * i + 2,
        smallest = i;
      if (left < n && this.heap[left][0] < this.heap[smallest][0])
        smallest = left;
      if (right < n && this.heap[right][0] < this.heap[smallest][0])
        smallest = right;
      if (smallest !== i) {
        [this.heap[i], this.heap[smallest]] = [
          this.heap[smallest],
          this.heap[i],
        ];
        i = smallest;
      } else break;
    }
  }
}
