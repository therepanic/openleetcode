function findLongestWord(s: string, dictionary: string[]): string {
  let ans = "";
  for (const word of dictionary) {
    let i = 0,
      j = 0;
    while (i < word.length && j < s.length) {
      if (word[i] === s[j]) {
        i++;
      }
      j++;
    }
    if (i === word.length) {
      if (word.length > ans.length) {
        ans = word;
      } else if (word.length === ans.length && word < ans) {
        ans = word;
      }
    }
  }
  return ans;
}
