function commonChars(words: string[]): string[] {
  const freq: Record<string, number> = {};
  for (const c of words[0]) {
    freq[c] = (freq[c] || 0) + 1;
  }
  for (let i = 1; i < words.length; i++) {
    const f: Record<string, number> = {};
    for (const c of words[i]) {
      f[c] = (f[c] || 0) + 1;
    }
    for (const c in freq) {
      if (c in f) {
        freq[c] = Math.min(f[c], freq[c]);
      } else {
        freq[c] = 0;
      }
    }
  }
  const res: string[] = [];
  for (const c in freq) {
    for (let j = 0; j < freq[c]; j++) {
      res.push(c);
    }
  }
  return res;
}
