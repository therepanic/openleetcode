function threeSumMulti(arr: number[], target: number): number {
  arr.sort((a, b) => a - b);
  const cnt = new Map<number, number>();
  for (const x of arr) {
    cnt.set(x, (cnt.get(x) || 0) + 1);
  }
  let res = 0;
  let i = 0;
  const l = arr.length;
  const MOD = 1_000_000_007;

  while (i < l) {
    let j = i;
    let k = l - 1;

    while (j < k) {
      const s = arr[i] + arr[j] + arr[k];
      if (s < target) {
        j += cnt.get(arr[j])!;
      } else if (s > target) {
        k -= cnt.get(arr[k])!;
      } else {
        if (arr[i] !== arr[j] && arr[j] !== arr[k]) {
          res += cnt.get(arr[i])! * cnt.get(arr[j])! * cnt.get(arr[k])!;
        } else if (arr[i] === arr[j] && arr[j] !== arr[k]) {
          const c = cnt.get(arr[i])!;
          res += (c * (c - 1) * cnt.get(arr[k])!) / 2;
        } else if (arr[i] !== arr[j] && arr[j] === arr[k]) {
          const c = cnt.get(arr[j])!;
          res += (cnt.get(arr[i])! * c * (c - 1)) / 2;
        } else {
          const c = cnt.get(arr[i])!;
          res += (c * (c - 1) * (c - 2)) / 6;
        }
        j += cnt.get(arr[j])!;
        k -= cnt.get(arr[k])!;
      }
    }

    i += cnt.get(arr[i])!;
  }

  return res % MOD;
}
