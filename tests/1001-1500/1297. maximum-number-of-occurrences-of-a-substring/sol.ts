function maxFreq(
  s: string,
  maxLetters: number,
  minSize: number,
  maxSize: number,
): number {
  const count: Map<string, number> = new Map();
  const unique: Map<string, number> = new Map();
  let left = 0;
  let res = 0;
  for (let right = 0; right < s.length; right++) {
    const rc = s[right];
    unique.set(rc, (unique.get(rc) ?? 0) + 1);

    while (unique.size > maxLetters || right - left + 1 > minSize) {
      const lc = s[left];
      unique.set(lc, unique.get(lc)! - 1);
      if (unique.get(lc) === 0) {
        unique.delete(lc);
      }
      left++;
    }

    if (right - left + 1 === minSize && unique.size <= maxLetters) {
      const curr = s.substring(left, right + 1);
      const val = (count.get(curr) ?? 0) + 1;
      count.set(curr, val);
      res = Math.max(res, val);
    }
  }
  return res;
}
