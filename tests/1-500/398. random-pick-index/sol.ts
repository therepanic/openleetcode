class Solution {
  private map: Map<number, number[]> = new Map();

  constructor(nums: number[]) {
    for (let i = 0; i < nums.length; i++) {
      const v = nums[i];
      if (!this.map.has(v)) {
        this.map.set(v, []);
      }
      this.map.get(v)!.push(i);
    }
  }

  pick(target: number): number {
    const indices = this.map.get(target)!;
    return indices[Math.floor(Math.random() * indices.length)];
  }
}
