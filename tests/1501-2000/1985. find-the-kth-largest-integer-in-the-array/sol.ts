function kthLargestNumber(nums: string[], k: number): string {
  nums.sort((a, b) =>
    a.length !== b.length ? b.length - a.length : a < b ? 1 : a > b ? -1 : 0,
  );
  return nums[k - 1];
}
