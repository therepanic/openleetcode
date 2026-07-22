function maxValueAfterReverse(nums: number[]): number {
  if (nums.length < 2) return 0;

  let maxMin = -Infinity;
  let minMin = Infinity;
  let S = 0;
  let boundary = -Infinity;

  for (let i = 0; i < nums.length - 1; i++) {
    const a = nums[i];
    const b = nums[i + 1];
    const distance = Math.abs(a - b);
    boundary = Math.max(
      boundary,
      Math.max(Math.abs(nums[nums.length - 1] - a), Math.abs(nums[0] - b)) -
        distance,
    );
    S += distance;
    minMin = Math.min(Math.max(a, b), minMin);
    maxMin = Math.max(Math.min(a, b), maxMin);
  }

  return S + Math.max(2 * (maxMin - minMin), boundary);
}
