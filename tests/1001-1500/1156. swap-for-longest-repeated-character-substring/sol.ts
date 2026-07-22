function maxRepOpt1(text: string): number {
  const total: Map<string, number> = new Map();
  for (const c of text) {
    total.set(c, (total.get(c) || 0) + 1);
  }
  const n = text.length;
  let ans = 0;

  for (const [ch, chTotal] of total) {
    let left = 0;
    let count = 0;

    for (let right = 0; right < n; right++) {
      if (text[right] === ch) {
        count++;
      }

      while (right - left + 1 - count > 1) {
        if (text[left] === ch) {
          count--;
        }
        left++;
      }

      ans = Math.max(ans, Math.min(right - left + 1, chTotal));
    }
  }

  return ans;
}
