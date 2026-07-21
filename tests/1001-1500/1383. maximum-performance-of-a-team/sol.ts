function maxPerformance(
  n: number,
  speed: number[],
  efficiency: number[],
  k: number,
): number {
  const MOD = 1000000007n;
  const engineers: [number, number][] = [];
  for (let i = 0; i < n; i++) {
    engineers.push([efficiency[i], speed[i]]);
  }
  engineers.sort((a, b) => b[0] - a[0]);

  const pq = new MinPriorityQueue<number>();
  let curSum = 0n;
  let ans = 0n;

  for (const [e, s] of engineers) {
    while (pq.size() > k - 1) {
      curSum -= BigInt(pq.dequeue().element);
    }
    pq.enqueue(s);
    curSum += BigInt(s);
    const performance = curSum * BigInt(e);
    if (performance > ans) ans = performance;
  }

  return Number(ans % MOD);
}

class MinPriorityQueue<T> {
  private heap: T[] = [];

  enqueue(value: T): void {
    this.heap.push(value);
    let index = this.heap.length - 1;
    while (index > 0) {
      const parent = Math.floor((index - 1) / 2);
      if ((this.heap[parent] as any) <= (this.heap[index] as any)) break;
      [this.heap[parent], this.heap[index]] = [
        this.heap[index],
        this.heap[parent],
      ];
      index = parent;
    }
  }

  dequeue(): { element: T } {
    const element = this.heap[0];
    const last = this.heap.pop()!;
    if (this.heap.length > 0) {
      this.heap[0] = last;
      let index = 0;
      while (true) {
        const left = index * 2 + 1;
        const right = left + 1;
        let smallest = index;
        if (
          left < this.heap.length &&
          (this.heap[left] as any) < (this.heap[smallest] as any)
        )
          smallest = left;
        if (
          right < this.heap.length &&
          (this.heap[right] as any) < (this.heap[smallest] as any)
        )
          smallest = right;
        if (smallest === index) break;
        [this.heap[index], this.heap[smallest]] = [
          this.heap[smallest],
          this.heap[index],
        ];
        index = smallest;
      }
    }
    return { element };
  }

  size(): number {
    return this.heap.length;
  }
}
