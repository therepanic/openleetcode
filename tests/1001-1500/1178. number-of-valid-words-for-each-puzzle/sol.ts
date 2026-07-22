function findNumOfValidWords(words: string[], puzzles: string[]): number[] {
  const getMask = (s: string): number => {
    let mask = 0;
    for (let i = 0; i < s.length; i++) {
      mask |= 1 << (s.charCodeAt(i) - 97);
    }
    return mask;
  };

  const wordCount = new Map<number, number>();
  for (const w of words) {
    const mask = getMask(w);
    wordCount.set(mask, (wordCount.get(mask) || 0) + 1);
  }

  const result: number[] = [];
  for (const p of puzzles) {
    const firstMask = 1 << (p.charCodeAt(0) - 97);
    const puzzleMask = getMask(p);
    let sub = puzzleMask;
    let count = 0;
    while (true) {
      if ((sub & firstMask) !== 0) {
        count += wordCount.get(sub) || 0;
      }
      if (sub === 0) break;
      sub = (sub - 1) & puzzleMask;
    }
    result.push(count);
  }
  return result;
}
