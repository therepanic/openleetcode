function hasAllCodes(s: string, k: number): boolean {
  let req = 1 << k;
  const seen: boolean[] = new Array(req).fill(false);
  const mask = req - 1;
  let h = 0;

  for (let i = 0; i < s.length; i++) {
    h = ((h << 1) & mask) | (s.charCodeAt(i) & 1);

    if (i >= k - 1 && !seen[h]) {
      seen[h] = true;
      req--;
      if (req === 0) return true;
    }
  }

  return false;
}
