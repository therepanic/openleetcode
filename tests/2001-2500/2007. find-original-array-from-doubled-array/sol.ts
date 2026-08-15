function findOriginalArray(changed: number[]): number[] {
  if (changed.length % 2 !== 0) return [];

  let count = new Map<number, number>();
  for (let num of changed) {
    count.set(num, (count.get(num) || 0) + 1);
  }
  changed.sort((a, b) => a - b);
  let original: number[] = [];

  for (let num of changed) {
    if (count.get(num) === 0) continue;
    if (!count.get(2 * num) || count.get(2 * num) === 0) return [];
    original.push(num);
    count.set(num, count.get(num)! - 1);
    count.set(2 * num, count.get(2 * num)! - 1);
  }

  return original;
}
