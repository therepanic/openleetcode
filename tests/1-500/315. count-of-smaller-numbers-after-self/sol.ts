function countSmaller(nums: number[]): number[] {
  const sortedList: number[] = [];
  const ans: number[] = [];
  for (let i = nums.length - 1; i >= 0; i--) {
    const n = nums[i];
    const idx = bisectLeft(sortedList, n);
    ans.push(idx);
    sortedList.splice(idx, 0, n);
  }
  return ans.reverse();
}

function bisectLeft(list: number[], target: number): number {
  let lo = 0,
    hi = list.length;
  while (lo < hi) {
    const mid = lo + ((hi - lo) >> 1);
    if (list[mid] >= target) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}
