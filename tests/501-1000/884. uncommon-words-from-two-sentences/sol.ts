function uncommonFromSentences(s1: string, s2: string): string[] {
  const words = [...s1.split(" "), ...s2.split(" ")];
  const count: { [key: string]: number } = {};
  for (const word of words) {
    count[word] = (count[word] || 0) + 1;
  }
  return Object.entries(count)
    .filter(([_, c]) => c === 1)
    .map(([word]) => word);
}
