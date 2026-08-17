function waysToSplit(nums: number[]): number {
  const MOD = 1000000007;
  const n = nums.length;
  const prefix: number[] = new Array(n);
  prefix[0] = nums[0];

  for (let i = 1; i < n; i++) {
    prefix[i] = prefix[i - 1] + nums[i];
  }

  let res = 0;
  for (let i = 0; i < n - 2; i++) {
    const left = prefix[i];
    const j = lowerBound(prefix, 2 * left, i + 1, n - 1);
    const k = upperBound(
      prefix,
      Math.floor((prefix[n - 1] + left) / 2),
      j,
      n - 1,
    );
    if (j < k) {
      res = (res + (k - j)) % MOD;
    }
  }
  return res;
}

function lowerBound(
  arr: number[],
  target: number,
  lo: number,
  hi: number,
): number {
  let l = lo,
    h = hi;
  while (l < h) {
    const mid = Math.floor((l + h) / 2);
    if (arr[mid] < target) {
      l = mid + 1;
    } else {
      h = mid;
    }
  }
  return l;
}

function upperBound(
  arr: number[],
  target: number,
  lo: number,
  hi: number,
): number {
  let l = lo,
    h = hi;
  while (l < h) {
    const mid = Math.floor((l + h) / 2);
    if (arr[mid] <= target) {
      l = mid + 1;
    } else {
      h = mid;
    }
  }
  return l;
}
