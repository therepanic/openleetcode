function distinctEchoSubstrings(text: string): number {
  const found = new Set<string>();
  const n = text.length;
  for (let start = 0; start < n; start++) {
    for (let length = 1; start + 2 * length <= n; length++) {
      const first = text.slice(start, start + length);
      if (first === text.slice(start + length, start + 2 * length)) {
        found.add(first);
      }
    }
  }
  return found.size;
}
