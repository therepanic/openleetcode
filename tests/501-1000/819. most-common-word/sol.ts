function mostCommonWord(paragraph: string, banned: string[]): string {
  const bannedSet = new Set(banned);
  const counts: Map<string, number> = new Map();
  const words = paragraph.toLowerCase().split(/[^a-z]+/);
  for (const w of words) {
    if (w && !bannedSet.has(w)) {
      counts.set(w, (counts.get(w) || 0) + 1);
    }
  }
  let result = "";
  let maxCount = 0;
  for (const [k, v] of counts) {
    if (v > maxCount) {
      maxCount = v;
      result = k;
    }
  }
  return result;
}
