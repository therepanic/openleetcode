function movesToMakeZigzag(nums: number[]): number {
  const n = nums.length;

  const findValleys = (mode: number): number => {
    let res = 0;
    for (let i = 0; i < n; i++) {
      if (i % 2 === mode) {
        const left = i - 1 >= 0 ? nums[i - 1] : Infinity;
        const right = i + 1 < n ? nums[i + 1] : Infinity;
        const minNeighbor = Math.min(left, right);
        if (nums[i] >= minNeighbor) {
          res += nums[i] - (minNeighbor - 1);
        }
      }
    }
    return res;
  };

  return Math.min(findValleys(0), findValleys(1));
}
