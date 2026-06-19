class Heap {
  private data: number[] = [];
  private readonly cmp: (a: number, b: number) => boolean;

  constructor(cmp: (a: number, b: number) => boolean) {
    this.cmp = cmp;
  }

  size(): number {
    return this.data.length;
  }

  peek(): number {
    return this.data[0];
  }

  push(value: number): void {
    this.data.push(value);
    let i = this.data.length - 1;
    while (i > 0) {
      const p = (i - 1) >> 1;
      if (!this.cmp(this.data[i], this.data[p])) break;
      [this.data[i], this.data[p]] = [this.data[p], this.data[i]];
      i = p;
    }
  }

  pop(): number {
    const root = this.data[0];
    const last = this.data.pop()!;
    if (this.data.length > 0) {
      this.data[0] = last;
      let i = 0;
      while (true) {
        let best = i;
        const left = i * 2 + 1;
        const right = left + 1;
        if (
          left < this.data.length &&
          this.cmp(this.data[left], this.data[best])
        )
          best = left;
        if (
          right < this.data.length &&
          this.cmp(this.data[right], this.data[best])
        )
          best = right;
        if (best === i) break;
        [this.data[i], this.data[best]] = [this.data[best], this.data[i]];
        i = best;
      }
    }
    return root;
  }
}

class DualHeap {
  private small = new Heap((a, b) => a > b);
  private large = new Heap((a, b) => a < b);
  private delayed = new Map<number, number>();
  private smallSize = 0;
  private largeSize = 0;

  constructor(private readonly k: number) {}

  private decDelayed(num: number): void {
    const next = (this.delayed.get(num) || 0) - 1;
    if (next === 0) this.delayed.delete(num);
    else this.delayed.set(num, next);
  }

  private pruneSmall(): void {
    while (this.small.size() > 0) {
      const num = this.small.peek();
      if (!this.delayed.has(num)) break;
      this.decDelayed(num);
      this.small.pop();
    }
  }

  private pruneLarge(): void {
    while (this.large.size() > 0) {
      const num = this.large.peek();
      if (!this.delayed.has(num)) break;
      this.decDelayed(num);
      this.large.pop();
    }
  }

  private makeBalance(): void {
    if (this.smallSize > this.largeSize + 1) {
      this.large.push(this.small.pop());
      this.smallSize--;
      this.largeSize++;
      this.pruneSmall();
    } else if (this.smallSize < this.largeSize) {
      this.small.push(this.large.pop());
      this.smallSize++;
      this.largeSize--;
      this.pruneLarge();
    }
  }

  insert(num: number): void {
    if (this.small.size() === 0 || num <= this.small.peek()) {
      this.small.push(num);
      this.smallSize++;
    } else {
      this.large.push(num);
      this.largeSize++;
    }
    this.makeBalance();
  }

  erase(num: number): void {
    this.delayed.set(num, (this.delayed.get(num) || 0) + 1);
    if (num <= this.small.peek()) {
      this.smallSize--;
      if (num === this.small.peek()) this.pruneSmall();
    } else {
      this.largeSize--;
      if (this.large.size() > 0 && num === this.large.peek()) this.pruneLarge();
    }
    this.makeBalance();
  }

  median(): number {
    if (this.k % 2 === 1) return this.small.peek();
    return (this.small.peek() + this.large.peek()) / 2.0;
  }
}

function medianSlidingWindow(nums: number[], k: number): number[] {
  const dh = new DualHeap(k);
  for (let i = 0; i < k; i++) dh.insert(nums[i]);
  const ans: number[] = [dh.median()];
  for (let i = k; i < nums.length; i++) {
    dh.insert(nums[i]);
    dh.erase(nums[i - k]);
    ans.push(dh.median());
  }
  return ans;
}
