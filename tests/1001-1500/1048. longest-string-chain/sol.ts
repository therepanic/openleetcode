function longestStrChain(words: string[]): number {
  const chains: Map<string, number> = new Map();
  words.sort((a, b) => a.length - b.length);

  for (const word of words) {
    chains.set(word, 1);
    for (let i = 0; i < word.length; i++) {
      const pred = word.slice(0, i) + word.slice(i + 1);
      if (chains.has(pred)) {
        chains.set(word, Math.max(chains.get(word)!, chains.get(pred)! + 1));
      }
    }
  }

  let maxLen = 0;
  for (const len of chains.values()) {
    maxLen = Math.max(maxLen, len);
  }
  return maxLen;
}
