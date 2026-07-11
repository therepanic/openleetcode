function bestRotation(nums: number[]): number {
  const n = nums.length;
  const diffs = new Array(n + 1).fill(0);
  for (let i = 0; i < n; i++) {
    const left = (((i - nums[i] + 1) % n) + n) % n;
    const right = (i + 1) % n;
    diffs[left]--;
    diffs[right]++;
    if (left > right) {
      diffs[0]--;
    }
  }
  let best = 0;
  let cur = n;
  let maxScore = cur;
  for (let k = 1; k < n; k++) {
    cur += diffs[k];
    if (cur > maxScore) {
      maxScore = cur;
      best = k;
    }
  }
  return best;
}
