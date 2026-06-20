function ladderLength(
  beginWord: string,
  endWord: string,
  wordList: string[],
): number {
  const wordSet = new Set(wordList);
  if (!wordSet.has(endWord)) return 0;
  const queue: Array<[string, number]> = [[beginWord, 1]];
  for (let head = 0; head < queue.length; head++) {
    const [word, steps] = queue[head];
    if (word === endWord) return steps;
    const chars = word.split("");
    for (let i = 0; i < chars.length; i++) {
      const original = chars[i];
      for (let code = 97; code <= 122; code++) {
        chars[i] = String.fromCharCode(code);
        const candidate = chars.join("");
        if (wordSet.delete(candidate)) queue.push([candidate, steps + 1]);
      }
      chars[i] = original;
    }
  }
  return 0;
}
