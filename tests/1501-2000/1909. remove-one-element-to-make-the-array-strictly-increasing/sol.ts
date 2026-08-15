function canBeIncreasing(nums: number[]): boolean {
  const n = nums.length;
  let idx = -1;

  for (let i = 0; i < n - 1; i++) {
    if (nums[i] >= nums[i + 1]) {
      idx = i;
      break;
    }
  }

  let flag = true;
  for (let i = idx + 1; i < n - 1; i++) {
    if (nums[i] >= nums[i + 1]) {
      flag = false;
      break;
    }
  }

  if ((idx === 0 || idx === n - 1) && flag) return true;
  if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] < nums[idx + 1] && flag)
    return true;

  for (let i = n - 1; i > 0; i--) {
    if (nums[i] <= nums[i - 1]) {
      idx = i;
      break;
    }
  }

  flag = true;
  for (let i = idx - 1; i > 0; i--) {
    if (nums[i] <= nums[i - 1]) {
      flag = false;
      break;
    }
  }

  if ((idx === 0 || idx === n - 1) && flag) return true;
  if (idx - 1 >= 0 && idx + 1 < n && nums[idx - 1] >= nums[idx + 1])
    return false;
  return flag;
}
