function threeSumClosest(nums: number[], target: number): number {
  nums.sort((a, b) => a - b);
  let best = nums[0] + nums[1] + nums[2];
  for (let i = 0; i + 2 < nums.length; i++) {
    let l = i + 1;
    let r = nums.length - 1;
    while (l < r) {
      const sum = nums[i] + nums[l] + nums[r];
      if (Math.abs(target - sum) < Math.abs(target - best)) best = sum;
      if (sum === target) return target;
      if (sum < target) l++;
      else r--;
    }
  }
  return best;
}
