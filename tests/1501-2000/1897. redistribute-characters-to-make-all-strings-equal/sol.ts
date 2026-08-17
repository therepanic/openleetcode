function makeEqual(words: string[]): boolean {
  const freq = new Array(26).fill(0);
  const n = words.length;
  for (const word of words) {
    for (const ch of word) {
      freq[ch.charCodeAt(0) - "a".charCodeAt(0)]++;
    }
  }
  for (const count of freq) {
    if (count % n !== 0) {
      return false;
    }
  }
  return true;
}
