function minWindow(s: string, t: string): string {
  if (s.length < t.length || t.length === 0) return "";

  const need = new Map<string, number>();
  for (const ch of t) need.set(ch, (need.get(ch) ?? 0) + 1);

  let missing = t.length;
  let left = 0;
  let bestL = 0;
  let bestLen = Number.MAX_SAFE_INTEGER;

  for (let right = 0; right < s.length; right++) {
    const ch = s[right];
    const cnt = need.get(ch) ?? 0;
    if (cnt > 0) missing--;
    need.set(ch, cnt - 1);

    while (missing === 0) {
      const currLen = right - left + 1;
      if (currLen < bestLen) {
        bestLen = currLen;
        bestL = left;
      }
      const d = s[left++];
      need.set(d, (need.get(d) ?? 0) + 1);
      if ((need.get(d) ?? 0) > 0) missing++;
    }
  }

  return bestLen === Number.MAX_SAFE_INTEGER
    ? ""
    : s.slice(bestL, bestL + bestLen);
}
