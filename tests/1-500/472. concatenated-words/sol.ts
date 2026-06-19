function findAllConcatenatedWordsInADict(words: string[]): string[] {
  const res: string[] = [];
  const wordSet = new Set(words);
  const incorrect = new Set<string>();

  function dfs(word: string): boolean {
    if (wordSet.has(word)) return true;
    if (incorrect.has(word)) return false;

    for (let i = 1; i < word.length; i++) {
      const prefix = word.substring(0, i);
      if (wordSet.has(prefix)) {
        const suffix = word.substring(i);
        if (dfs(suffix)) {
          return true;
        } else {
          incorrect.add(suffix);
        }
      }
    }

    incorrect.add(word);
    return false;
  }

  for (const word of words) {
    wordSet.delete(word);
    if (dfs(word)) {
      res.push(word);
    }
    wordSet.add(word);
  }

  return res;
}
