function findSubstring(s: string, words: string[]): number[] {
  const ans: number[] = [];
  if (s.length === 0 || words.length === 0) return ans;

  const wordLen = words[0].length;
  const wordCount = words.length;
  const target = new Map<string, number>();
  for (const word of words) target.set(word, (target.get(word) ?? 0) + 1);

  for (let offset = 0; offset < wordLen; offset++) {
    let left = offset;
    let right = offset;
    let used = 0;
    const window = new Map<string, number>();

    while (right + wordLen <= s.length) {
      const word = s.substring(right, right + wordLen);
      right += wordLen;

      if (target.has(word)) {
        window.set(word, (window.get(word) ?? 0) + 1);
        used++;
        while ((window.get(word) ?? 0) > (target.get(word) ?? 0)) {
          const leftWord = s.substring(left, left + wordLen);
          window.set(leftWord, (window.get(leftWord) ?? 0) - 1);
          left += wordLen;
          used--;
        }
        if (used === wordCount) {
          ans.push(left);
          const leftWord = s.substring(left, left + wordLen);
          window.set(leftWord, (window.get(leftWord) ?? 0) - 1);
          left += wordLen;
          used--;
        }
      } else {
        window.clear();
        used = 0;
        left = right;
      }
    }
  }

  return ans;
}
