function isPossible(nums: number[]): boolean {
  const count: Map<number, number> = new Map();
  const subseq: Map<number, number> = new Map();

  for (const num of nums) {
    count.set(num, (count.get(num) || 0) + 1);
  }

  for (const num of nums) {
    if (count.get(num) === 0) continue;
    if ((subseq.get(num - 1) || 0) > 0) {
      subseq.set(num - 1, subseq.get(num - 1)! - 1);
      subseq.set(num, (subseq.get(num) || 0) + 1);
    } else if ((count.get(num + 1) || 0) > 0 && (count.get(num + 2) || 0) > 0) {
      count.set(num + 1, count.get(num + 1)! - 1);
      count.set(num + 2, count.get(num + 2)! - 1);
      subseq.set(num + 2, (subseq.get(num + 2) || 0) + 1);
    } else {
      return false;
    }
    count.set(num, count.get(num)! - 1);
  }

  return true;
}
