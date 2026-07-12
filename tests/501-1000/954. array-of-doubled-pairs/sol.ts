function canReorderDoubled(arr: number[]): boolean {
  const freq: Map<number, number> = new Map();
  for (const i of arr) {
    freq.set(i, (freq.get(i) || 0) + 1);
  }

  arr.sort((a, b) => Math.abs(a) - Math.abs(b));
  for (const val of arr) {
    if (freq.get(val) === 0) continue;
    const target = val * 2;
    if (freq.has(target) && freq.get(target)! > 0) {
      freq.set(val, freq.get(val)! - 1);
      freq.set(target, freq.get(target)! - 1);
    } else {
      return false;
    }
  }
  return true;
}
