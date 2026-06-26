function findMaxLength(nums: number[]): number {
  let count = 0;
  let maxLength = 0;
  const countMap = new Map<number, number>();
  countMap.set(0, -1);

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === 0) {
      count--;
    } else {
      count++;
    }

    if (countMap.has(count)) {
      maxLength = Math.max(maxLength, i - countMap.get(count)!);
    } else {
      countMap.set(count, i);
    }
  }

  return maxLength;
}
