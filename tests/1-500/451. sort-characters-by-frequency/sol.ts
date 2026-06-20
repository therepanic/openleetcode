function frequencySort(s: string): string {
  const freq: Map<string, number> = new Map();
  for (const c of s) {
    freq.set(c, (freq.get(c) || 0) + 1);
  }
  const entries = Array.from(freq.entries());
  entries.sort((a, b) => b[1] - a[1]);
  let result = "";
  for (const [char, count] of entries) {
    result += char.repeat(count);
  }
  return result;
}
