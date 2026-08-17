function arrayStringsAreEqual(word1: string[], word2: string[]): boolean {
  const s1 = word1.join("");
  const s2 = word2.join("");
  return s1 === s2;
}
