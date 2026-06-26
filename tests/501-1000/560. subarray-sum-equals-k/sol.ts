function subarraySum(nums: number[], k: number): number {
  const subNum = new Map<number, number>();
  subNum.set(0, 1);
  let total = 0;
  let count = 0;

  for (const n of nums) {
    total += n;

    if (subNum.has(total - k)) {
      count += subNum.get(total - k)!;
    }

    subNum.set(total, (subNum.get(total) || 0) + 1);
  }

  return count;
}
