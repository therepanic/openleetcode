function mergeAlternately(word1: string, word2: string): string {
  const merged: string[] = [];
  const minLen = Math.min(word1.length, word2.length);
  for (let i = 0; i < minLen; i++) {
    merged.push(word1[i] + word2[i]);
  }
  if (word1.length > minLen) {
    merged.push(word1.slice(minLen));
  }
  if (word2.length > minLen) {
    merged.push(word2.slice(minLen));
  }
  return merged.join("");
}
