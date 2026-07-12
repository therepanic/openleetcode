function numSpecialEquivGroups(words: string[]): number {
  const seen = new Set<string>();
  for (const w of words) {
    const even: string[] = [];
    const odd: string[] = [];
    for (let i = 0; i < w.length; i++) {
      if (i % 2 === 0) {
        even.push(w[i]);
      } else {
        odd.push(w[i]);
      }
    }
    even.sort();
    odd.sort();
    seen.add(even.join("") + "," + odd.join(""));
  }
  return seen.size;
}
