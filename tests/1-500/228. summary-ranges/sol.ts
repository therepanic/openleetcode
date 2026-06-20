function summaryRanges(nums: number[]): string[] {
  const result: string[] = [];
  let i = 0;

  while (i < nums.length) {
    const start = nums[i];
    let j = i;
    while (j + 1 < nums.length && nums[j + 1] === nums[j] + 1) {
      j++;
    }

    if (nums[j] === start) {
      result.push(start.toString());
    } else {
      result.push(`${start}->${nums[j]}`);
    }

    i = j + 1;
  }

  return result;
}
