function findAndReplacePattern(words: string[], pattern: string): string[] {
  const counts = pattern.split("").map((c) => pattern.indexOf(c));
  const res: string[] = [];
  for (const word of words) {
    const count = word.split("").map((c) => word.indexOf(c));
    if (count.every((v, i) => v === counts[i])) {
      res.push(word);
    }
  }
  return res;
}
