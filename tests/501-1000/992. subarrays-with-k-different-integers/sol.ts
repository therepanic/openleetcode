function subarraysWithKDistinct(nums: number[], k: number): number {
  const atMost = (k: number): number => {
    const freq = new Map<number, number>();
    let count = 0;
    let left = 0;
    const n = nums.length;

    for (let right = 0; right < n; right++) {
      freq.set(nums[right], (freq.get(nums[right]) || 0) + 1);

      while (freq.size > k) {
        const val = freq.get(nums[left])!;
        if (val > 1) {
          freq.set(nums[left], val - 1);
        } else {
          freq.delete(nums[left]);
        }
        left++;
      }

      count += right - left + 1;
    }

    return count;
  };

  return atMost(k) - atMost(k - 1);
}
