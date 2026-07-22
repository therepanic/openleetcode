function maxNumberOfBalloons(text: string): number {
  const f: Record<string, number> = {};
  for (const c of text) {
    f[c] = (f[c] || 0) + 1;
  }
  return Math.min(
    f["b"] || 0,
    f["a"] || 0,
    (f["l"] || 0) >> 1,
    (f["o"] || 0) >> 1,
    f["n"] || 0,
  );
}
