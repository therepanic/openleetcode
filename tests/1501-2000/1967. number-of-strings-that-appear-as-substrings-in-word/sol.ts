function numOfStrings(patterns: string[], word: string): number {
  let count = 0;
  for (const s of patterns) {
    if (word.includes(s)) {
      count++;
    }
  }
  return count;
}
