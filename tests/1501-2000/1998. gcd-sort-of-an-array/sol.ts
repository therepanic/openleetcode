function gcdSort(nums: number[]): boolean {
  class UnionFind {
    parent: number[];
    size: number[];
    constructor(n: number) {
      this.parent = Array.from({ length: n }, (_, i) => i);
      this.size = new Array(n).fill(1);
    }
    find(x: number): number {
      if (this.parent[x] !== x) {
        this.parent[x] = this.find(this.parent[x]);
      }
      return this.parent[x];
    }
    union(x: number, y: number): void {
      const px = this.find(x);
      const py = this.find(y);
      if (px !== py) {
        if (this.size[px] < this.size[py]) {
          this.parent[px] = py;
          this.size[py] += this.size[px];
        } else {
          this.parent[py] = px;
          this.size[px] += this.size[py];
        }
      }
    }
    connected(x: number, y: number): boolean {
      return this.find(x) === this.find(y);
    }
  }

  const maxVal = Math.max(...nums, 0);
  const uf = new UnionFind(maxVal + 1);
  for (const num of nums) {
    let n = num;
    let i = 2;
    while (i * i <= n) {
      if (n % i === 0) {
        uf.union(i, num);
        while (n % i === 0) {
          n = Math.floor(n / i);
        }
      }
      i++;
    }
    if (n > 1) {
      uf.union(n, num);
    }
  }
  const sorted = [...nums].sort((a, b) => a - b);
  for (let i = 0; i < nums.length; i++) {
    if (!uf.connected(nums[i], sorted[i])) {
      return false;
    }
  }
  return true;
}
