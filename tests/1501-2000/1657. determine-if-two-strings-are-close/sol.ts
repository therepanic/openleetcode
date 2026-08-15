function closeStrings(word1: string, word2: string): boolean {
  if (word1.length !== word2.length) return false;
  const set1 = new Set(word1);
  const set2 = new Set(word2);
  if (set1.size !== set2.size) return false;
  for (const c of set1) {
    if (!set2.has(c)) return false;
  }
  const dct: Map<number, number> = new Map();
  for (const x of set1) {
    const n1 = countChar(word1, x);
    const n2 = countChar(word2, x);
    dct.set(n1, (dct.get(n1) ?? 0) + 1);
    dct.set(n2, (dct.get(n2) ?? 0) - 1);
  }
  for (const v of dct.values()) {
    if (v !== 0) return false;
  }
  return true;
}

function countChar(s: string, c: string): number {
  return s.split("").filter((ch) => ch === c).length;
}
