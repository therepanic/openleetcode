function searchRange(nums: number[], target: number): number[] {
  const bound = (left: boolean): number => {
    let low = 0;
    let high = nums.length - 1;
    let ans = -1;

    while (low <= high) {
      const mid = low + Math.floor((high - low) / 2);
      if (nums[mid] < target) {
        low = mid + 1;
      } else if (nums[mid] > target) {
        high = mid - 1;
      } else {
        ans = mid;
        if (left) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      }
    }

    return ans;
  };

  return [bound(true), bound(false)];
}
