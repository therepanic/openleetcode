function findMaximizedCapital(
  k: number,
  w: number,
  profits: number[],
  capital: number[],
): number {
  const n = profits.length;
  const projects: [number, number][] = [];
  for (let i = 0; i < n; i++) {
    projects.push([capital[i], profits[i]]);
  }
  projects.sort((a, b) => a[0] - b[0]);
  const maxHeap = new MaxHeap();
  let i = 0;
  for (let j = 0; j < k; j++) {
    while (i < n && projects[i][0] <= w) {
      maxHeap.push(projects[i][1]);
      i++;
    }
    if (maxHeap.isEmpty()) break;
    w += maxHeap.pop();
  }
  return w;
}

class MaxHeap {
  private data: number[] = [];

  isEmpty(): boolean {
    return this.data.length === 0;
  }

  push(value: number): void {
    this.data.push(value);
    let i = this.data.length - 1;
    while (i > 0) {
      const p = (i - 1) >> 1;
      if (this.data[p] >= this.data[i]) {
        break;
      }
      [this.data[p], this.data[i]] = [this.data[i], this.data[p]];
      i = p;
    }
  }

  pop(): number {
    const result = this.data[0];
    const last = this.data.pop()!;
    if (this.data.length > 0) {
      this.data[0] = last;
      let i = 0;
      while (true) {
        const left = i * 2 + 1;
        const right = left + 1;
        let best = i;
        if (left < this.data.length && this.data[left] > this.data[best]) {
          best = left;
        }
        if (right < this.data.length && this.data[right] > this.data[best]) {
          best = right;
        }
        if (best === i) {
          break;
        }
        [this.data[i], this.data[best]] = [this.data[best], this.data[i]];
        i = best;
      }
    }
    return result;
  }
}
