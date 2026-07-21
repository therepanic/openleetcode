function makeArrayIncreasing(arr1: number[], arr2: number[]): number {
  arr2.sort((a, b) => a - b);
  const memo = new Map<string, number>();

  function bisectRight(arr: number[], target: number): number {
    let lo = 0,
      hi = arr.length;
    while (lo < hi) {
      const mid = lo + ((hi - lo) >> 1);
      if (arr[mid] <= target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    return lo;
  }

  function dfs(i: number, prevMax: number): number {
    if (i === arr1.length) return 0;

    const key = `${i},${prevMax}`;
    if (memo.has(key)) return memo.get(key)!;

    const j = bisectRight(arr2, prevMax);

    let ans = Number.MAX_SAFE_INTEGER;
    if (arr1[i] > prevMax) {
      ans = Math.min(ans, dfs(i + 1, arr1[i]));
    }
    if (j < arr2.length) {
      ans = Math.min(ans, dfs(i + 1, arr2[j]) + 1);
    }

    memo.set(key, ans);
    return ans;
  }

  const ops = dfs(0, -Number.MAX_SAFE_INTEGER);
  return ops >= Number.MAX_SAFE_INTEGER ? -1 : ops;
}
