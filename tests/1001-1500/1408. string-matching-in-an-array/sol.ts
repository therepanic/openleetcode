function stringMatching(words: string[]): string[] {
  const n = words.length;
  const ans: string[] = [];
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n; j++) {
      if (i !== j && words[j].includes(words[i])) {
        ans.push(words[i]);
        break;
      }
    }
  }
  return ans;
}
