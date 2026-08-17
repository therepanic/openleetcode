function isPrefixString(s: string, words: string[]): boolean {
  let res = "";
  let i = 0;
  while (res.length < s.length) {
    if (i >= words.length) return false;
    res += words[i];
    i++;
  }
  return res === s;
}
