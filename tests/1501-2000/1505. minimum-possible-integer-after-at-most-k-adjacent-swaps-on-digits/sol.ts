function minInteger(num: string, k: number): string {
  const n = num.length;
  const dict: Map<string, number[]> = new Map();
  for (let i = 0; i < n; i++) {
    const ch = num[i];
    if (!dict.has(ch)) dict.set(ch, []);
    dict.get(ch)!.push(i);
  }

  const bit: number[] = new Array(n + 1).fill(0);
  const update = (i: number, val: number) => {
    while (i < bit.length) {
      bit[i] += val;
      i += i & -i;
    }
  };
  const query = (i: number): number => {
    let total = 0;
    while (i > 0) {
      total += bit[i];
      i -= i & -i;
    }
    return total;
  };

  for (let i = 1; i <= n; i++) {
    update(i, 1);
  }

  let remaining = k;
  let res = "";
  for (let pos = 0; pos < n; pos++) {
    for (const v of "0123456789") {
      const arr = dict.get(v);
      if (arr && arr.length > 0) {
        const idx = arr[0];
        const cnt = query(idx);
        if (cnt <= remaining) {
          arr.shift();
          remaining -= cnt;
          res += v;
          update(idx + 1, -1);
          break;
        }
      }
    }
  }
  return res;
}
