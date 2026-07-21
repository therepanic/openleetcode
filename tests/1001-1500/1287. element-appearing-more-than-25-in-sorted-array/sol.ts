function findSpecialInteger(arr: number[]): number {
  const n: number = arr.length;
  const q: number = Math.floor(n / 4);
  const m: Map<number, number> = new Map();
  for (const num of arr) {
    m.set(num, (m.get(num) || 0) + 1);
    if (m.get(num)! > q) {
      return num;
    }
  }
  return -1;
}
