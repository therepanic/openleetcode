function wordPattern(pattern: string, s: string): boolean {
  const words = s.split(" ");
  if (pattern.length !== words.length) return false;

  const patternSet = new Set(pattern.split(""));
  const wordSet = new Set(words);
  const pairSet = new Set<string>();

  for (let i = 0; i < pattern.length; i++) {
    pairSet.add(pattern[i] + "," + words[i]);
  }

  return patternSet.size === wordSet.size && wordSet.size === pairSet.size;
}
