function arrayNesting(nums: number[]): number {
  let maxCount = 0;

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === -1) {
      continue;
    }

    let currentCount = 0;
    let start = i;

    while (nums[start] !== -1) {
      const nextNode = nums[start];
      nums[start] = -1;
      start = nextNode;
      currentCount++;
    }

    if (currentCount > maxCount) {
      maxCount = currentCount;
    }
  }

  return maxCount;
}
