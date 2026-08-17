function longestAwesome(s: string): number {
  const n = s.length;
  const mask = new Map<number, number>();
  let curMask = 0;
  mask.set(curMask, -1);
  let ans = 1;
  for (let i = 0; i < n; i++) {
    const num = parseInt(s[i]);
    curMask ^= 1 << num;
    const needMask = curMask;
    if (mask.has(needMask)) {
      ans = Math.max(ans, i - mask.get(needMask)!);
    }
    for (let bit = 0; bit < 10; bit++) {
      const nNeedMax = needMask ^ (1 << bit);
      if (mask.has(nNeedMax)) {
        ans = Math.max(ans, i - mask.get(nNeedMax)!);
      }
    }
    if (!mask.has(curMask)) {
      mask.set(curMask, i);
    }
  }
  return ans;
}
