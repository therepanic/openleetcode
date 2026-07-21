function arrayRankTransform(arr: number[]): number[] {
  const s = [...arr].sort((a, b) => a - b);
  const unique: number[] = [];
  for (const x of s) {
    if (unique.length === 0 || unique[unique.length - 1] !== x) {
      unique.push(x);
    }
  }
  for (let i = 0; i < arr.length; i++) {
    arr[i] = bisectLeft(unique, arr[i]) + 1;
  }
  return arr;
}

function bisectLeft(a: number[], x: number): number {
  let lo = 0,
    hi = a.length;
  while (lo < hi) {
    const mid = (lo + hi) >> 1;
    if (a[mid] < x) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  return lo;
}
