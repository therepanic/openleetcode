function findLadders(
  beginWord: string,
  endWord: string,
  wordList: string[],
): string[][] {
  const depth = new Map<string, number>([[beginWord, 1]]);
  const result: string[][] = [];
  const wordSet = new Set(wordList);
  const queue: string[] = [beginWord];
  let head = 0;
  wordSet.delete(beginWord);
  while (head < queue.length) {
    const word = queue[head++];
    const steps = depth.get(word)!;
    if (word === endWord) break;
    const chars = word.split("");
    for (let i = 0; i < chars.length; i++) {
      const original = chars[i];
      for (let code = 97; code <= 122; code++) {
        chars[i] = String.fromCharCode(code);
        const candidate = chars.join("");
        if (wordSet.delete(candidate)) {
          queue.push(candidate);
          depth.set(candidate, steps + 1);
        }
      }
      chars[i] = original;
    }
  }
  if (!depth.has(endWord)) return result;
  const path = [endWord];
  const dfs = (word: string): void => {
    if (word === beginWord) {
      result.push(path.slice().reverse());
      return;
    }
    const steps = depth.get(word)!;
    const chars = word.split("");
    for (let i = 0; i < chars.length; i++) {
      const original = chars[i];
      for (let code = 97; code <= 122; code++) {
        chars[i] = String.fromCharCode(code);
        const candidate = chars.join("");
        const prev = depth.get(candidate);
        if (prev !== undefined && prev + 1 === steps) {
          path.push(candidate);
          dfs(candidate);
          path.pop();
        }
      }
      chars[i] = original;
    }
  };
  dfs(endWord);
  return result;
}
