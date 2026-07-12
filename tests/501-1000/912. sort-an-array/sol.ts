function sortArray(nums: number[]): number[] {
  function merge(nums: number[], l: number, mid: number, r: number): void {
    const a: number[] = [];
    const b: number[] = [];
    for (let i = l; i <= mid; i++) {
      a.push(nums[i]);
    }
    for (let j = mid + 1; j <= r; j++) {
      b.push(nums[j]);
    }
    let i = 0,
      j = 0,
      k = l;
    while (k <= r) {
      if (j === b.length) {
        nums[k] = a[i];
        i++;
      } else if (i === a.length) {
        nums[k] = b[j];
        j++;
      } else if (a[i] <= b[j]) {
        nums[k] = a[i];
        i++;
      } else {
        nums[k] = b[j];
        j++;
      }
      k++;
    }
  }

  function mergesort(nums: number[], l: number, r: number): void {
    if (l >= r) return;
    const mid = Math.floor((l + r) / 2);
    mergesort(nums, l, mid);
    mergesort(nums, mid + 1, r);
    merge(nums, l, mid, r);
  }

  mergesort(nums, 0, nums.length - 1);
  return nums;
}
