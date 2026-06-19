function circularArrayLoop(nums: number[]): boolean {
  const n = nums.length;
  const nextIndex = (i: number): number => {
    return (((i + nums[i]) % n) + n) % n;
  };

  for (let i = 0; i < n; i++) {
    let slow = i;
    let fast = nextIndex(i);
    while (
      nums[slow] * nums[fast] > 0 &&
      nums[slow] * nums[nextIndex(fast)] > 0
    ) {
      if (slow === fast) {
        if (slow === nextIndex(slow)) break;
        return true;
      }
      slow = nextIndex(slow);
      fast = nextIndex(nextIndex(fast));
    }
    let j = i;
    while (nums[j] * nums[nextIndex(j)] > 0) {
      const temp = j;
      j = nextIndex(j);
      nums[temp] = 0;
    }
  }
  return false;
}
