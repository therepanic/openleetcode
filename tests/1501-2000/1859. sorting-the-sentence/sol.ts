function sortSentence(s: string): string {
  const words: Record<number, string> = {};
  for (const word of s.split(" ")) {
    const key = parseInt(word[word.length - 1]);
    words[key] = word.slice(0, -1);
  }
  return Object.keys(words)
    .sort((a, b) => Number(a) - Number(b))
    .map((k) => words[Number(k)])
    .join(" ");
}
