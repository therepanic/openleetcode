function maxOperations(nums: number[], k: number): number {
  nums.sort((a, b) => a - b);
  let i = 0,
    j = nums.length - 1;
  let count = 0;

  while (i < j) {
    const total = nums[i] + nums[j];
    if (total === k) {
      count++;
      i++;
      j--;
    } else if (total > k) {
      j--;
    } else {
      i++;
    }
  }

  return count;
}
