function countQuadruplets(nums: number[]): number {
  let res = 0;
  const n = nums.length;
  for (let w = 0; w < n; w++) {
    for (let x = w + 1; x < n; x++) {
      for (let y = x + 1; y < n; y++) {
        for (let z = y + 1; z < n; z++) {
          if (nums[w] + nums[x] + nums[y] === nums[z]) {
            res++;
          }
        }
      }
    }
  }
  return res;
}
