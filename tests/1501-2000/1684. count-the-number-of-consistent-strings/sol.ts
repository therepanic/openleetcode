function countConsistentStrings(allowed: string, words: string[]): number {
  let result = 0;
  const allowedSet = new Set(allowed);
  for (const word of words) {
    let allIn = true;
    for (const c of word) {
      if (!allowedSet.has(c)) {
        allIn = false;
        break;
      }
    }
    if (allIn) result++;
  }
  return result;
}
