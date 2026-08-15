function areOccurrencesEqual(s: string): boolean {
  const map = new Map<string, number>();
  for (const c of s) {
    map.set(c, (map.get(c) || 0) + 1);
  }
  return new Set(map.values()).size === 1;
}
