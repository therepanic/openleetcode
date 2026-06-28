function deleteAndEarn(nums: number[]): number {
  const count: Map<number, number> = new Map();
  for (const num of nums) {
    count.set(num, (count.get(num) || 0) + 1);
  }
  const uniqueNums = Array.from(count.keys()).sort((a, b) => a - b);
  let prev: number | null = null;
  let take = 0,
    skip = 0;

  for (const num of uniqueNums) {
    const maxPoints = Math.max(skip, take);
    if (prev !== null && prev === num - 1) {
      take = num * count.get(num)! + skip;
      skip = maxPoints;
    } else {
      take = num * count.get(num)! + maxPoints;
      skip = maxPoints;
    }
    prev = num;
  }

  return Math.max(take, skip);
}
