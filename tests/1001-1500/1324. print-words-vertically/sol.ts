function printVertically(s: string): string[] {
  const words = s.split(" ");
  let maxLen = 0;
  for (const word of words) {
    if (word.length > maxLen) {
      maxLen = word.length;
    }
  }
  const res: string[] = [];
  for (let i = 0; i < maxLen; i++) {
    let currWord = "";
    for (const word of words) {
      if (i < word.length) {
        currWord += word[i];
      } else {
        currWord += " ";
      }
    }
    res.push(currWord.trimEnd());
  }
  return res;
}
