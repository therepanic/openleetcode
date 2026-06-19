function findWords(words: string[]): string[] {
  const m: { [key: string]: number } = {};
  for (const c of "qwertyuiop") m[c] = 1;
  for (const c of "asdfghjkl") m[c] = 2;
  for (const c of "zxcvbnm") m[c] = 3;
  const ans: string[] = [];
  for (const w of words) {
    const lw = w.toLowerCase();
    const r = m[lw[0]];
    if (lw.split("").every((ch) => m[ch] === r)) {
      ans.push(w);
    }
  }
  return ans;
}
