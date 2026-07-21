function balancedString(s: string): number {
  const n = s.length;
  const each = n / 4;
  const count: { [key: string]: number } = {};
  for (const c of s) {
    count[c] = (count[c] || 0) + 1;
  }
  const extra: { [key: string]: number } = {};
  for (const k in count) {
    if (count[k] > each) {
      extra[k] = count[k] - each;
    }
  }
  if (Object.keys(extra).length === 0) return 0;
  let left = 0;
  let res = Infinity;
  const curr: { [key: string]: number } = {};
  for (let right = 0; right < n; right++) {
    const rc = s[right];
    if (rc in extra) {
      curr[rc] = (curr[rc] || 0) + 1;
    }
    while (
      Object.keys(extra).every((k) => (curr[k] || 0) >= extra[k]) &&
      left <= right
    ) {
      res = Math.min(res, right - left + 1);
      const lc = s[left];
      if (lc in curr) {
        curr[lc]--;
        if (curr[lc] === 0) {
          delete curr[lc];
        }
      }
      left++;
    }
  }
  return res;
}
