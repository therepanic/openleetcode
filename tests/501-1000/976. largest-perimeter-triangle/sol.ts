function largestPerimeter(nums: number[]): number {
  const minVal = Math.min(...nums);
  const maxVal = Math.max(...nums);

  const freq = new Array(maxVal - minVal + 1).fill(0);
  for (const x of nums) {
    freq[x - minVal]++;
  }

  let idx = 0;
  for (let v = maxVal; v >= minVal; v--) {
    while (freq[v - minVal] > 0) {
      nums[idx] = v;
      idx++;
      freq[v - minVal]--;
    }
  }

  for (let i = 0; i < nums.length - 2; i++) {
    if (nums[i + 1] + nums[i + 2] > nums[i]) {
      return nums[i] + nums[i + 1] + nums[i + 2];
    }
  }
  return 0;
}
