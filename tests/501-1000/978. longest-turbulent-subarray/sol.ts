function maxTurbulenceSize(arr: number[]): number {
  const N = arr.length;
  if (N < 2) return N;

  let ans = 1;
  let anchor = 0;

  const compare = (x: number, y: number): number => {
    if (x < y) return -1;
    if (x > y) return 1;
    return 0;
  };

  for (let i = 1; i < N; i++) {
    const c = compare(arr[i - 1], arr[i]);
    if (c === 0) {
      anchor = i;
    } else {
      if (i === N - 1 || c * compare(arr[i], arr[i + 1]) !== -1) {
        ans = Math.max(ans, i - anchor + 1);
        anchor = i;
      }
    }
  }
  return ans;
}
