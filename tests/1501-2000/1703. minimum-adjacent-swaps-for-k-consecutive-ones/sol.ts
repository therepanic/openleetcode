function minMoves(nums: number[], k: number): number {
  const idx: number[] = [];
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === 1) idx.push(i);
  }
  const n = idx.length;
  const a: number[] = [];
  for (let i = 0; i < n; i++) {
    a.push(idx[i] - i);
  }
  const prefix: number[] = new Array(n).fill(0);
  if (n > 0) {
    prefix[0] = a[0];
    for (let i = 1; i < n; i++) {
      prefix[i] = prefix[i - 1] + a[i];
    }
  }
  let ans = Number.MAX_SAFE_INTEGER;
  let l = 0;
  for (let r = 0; r < n; r++) {
    while (r - l + 1 > k) l++;
    if (r - l + 1 === k) {
      const mid = Math.floor((l + r) / 2);
      const med = a[mid];
      const leftSum = prefix[mid] - (l > 0 ? prefix[l - 1] : 0);
      const rightSum = prefix[r] - prefix[mid];
      const cost = med * (mid - l + 1) - leftSum + (rightSum - med * (r - mid));
      ans = Math.min(ans, cost);
    }
  }
  return ans;
}
